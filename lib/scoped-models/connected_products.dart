import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/user.dart';

// 164.3 ConnectedProducts to ConnectedProductsModel
//162.3
mixin ConnectedProductsModel on Model {
  //163
  // 162.5 cut/past
  //160.1
// 146.4 cut/past from main.dart
  List<Product> _products = []; // 162.5
  // 162.6 cut/past
  User _authenticationUser; //162.6
  //162.11 cut/past    // 162.15 selectedProductIndex to selProductIndex
  int _selProductIndex; //162.11

  // 162.4 cut/past function
  // 146.8.1 void _addProduct(Product product) {
  //162.1 void addProduct(Product product) {
  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        //162.9
        userEmail: _authenticationUser.email,
        userId: _authenticationUser.id // 162.9
        ); // 162.1
    /*146.5 setState(() {
      _products.add(product);
    }); */
    _products.add(newProduct); //162.10 product);
    // 150.7.1    // 162.15 selectedProductIndex to selProductIndex
    //164.4 _selProductIndex = null;
    //155.2
    notifyListeners();
  }
}

// 164.1 cut/past to connected_product

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  bool get displayFavoriteOnly {
    return _showFavorites;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = updatedProduct;
//164.4 _selProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    //164.4 _selProductIndex = null;
    //155.2
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    // 165.3
    if (index != null) {
      //155.2
      notifyListeners();
    }
  }

// 153.2
  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        // 162.16
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId, //162.16
        isFavorite: newFavoriteStatus);
    _products[selectedProductIndex] = updatedProduct;

    // 155.1
    notifyListeners(); //155.1

    //164.4 _selProductIndex = null;
  } // 153.2

  // 156.2
  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    // 156.10
    notifyListeners();
  }
} //164.1

// 164.2 cut/ past to connected_products.dart
mixin UserModel on ConnectedProductsModel {
  //162.8 on Model {

  void login(String email, String password) {
    _authenticationUser = User(id: 'asdadad', email: email, password: password);
  }
} // 164.2

// 162.12 change _products to products & _selectedProductIndex to selectedProductIndex it's not private here
// 162.13 change _authenticationUser to authenticationUser it's not private here
/* 164 we want to make products to _products & selProductIndex to _selProductIndex
authenticationUser to _authenticationUser to make these properties private 
so we need to copy all calass in products.dart and user.dart here to just access
 to this file just at this file */
