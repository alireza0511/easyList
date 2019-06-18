//146.2 import model
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import './connected_products.dart';

/* 164.1 cut/past to connected_product
// 160.1 class ProductsModel extends Model {
// 146.3 create a class for handel our model
//162.7 mixin ProductsModel on Model {
  mixin ProductsModel on ConnectedProducts { //162.7
 /* 162.5 cut/past
  //160.1
// 146.4 cut/past from main.dart
  List<Product> _products = []; 162.5*/

  // 150.1 we want to have index through our model
  /* 162.11 cut/past
  int _selectedProductIndex;  162.11*/

  // 156.1 add a variable to show  just favorite list
  bool _showFavorites = false;

  /* 146.9 getter method
  So since this would return a list, I actually want to return a copy of that
  so that I return a new list of products and not the existing one because again,
  only one instance of that would be stored in memory and now this would be a 
  pointer pointing at that value and this would essentially return a new 
  pointer. I can create a new list by using the built-in list class which 
  has a from constructor
  */
  List<Product> get allProducts {// 162.14 change products to allProducts it's not private hereproducts {
    return List.from(products);
  }

  //156.3
  List<Product> get displayedProducts {
    if (_showFavorites) {
      // 156.4 with where we can add our restriction to create a new array
      return products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(products);
  }

//150.8
  int get selectedProductIndex {
   // 162.15 selectedProductIndex to selProductIndex
    return selProductIndex;
  }

//150.10
  Product get selectedProduct {
    // 150.18
    if (selectedProductIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

  // 156.8 getter for this variable
  bool get displayFavoriteOnly {
    return _showFavorites;
  }

/* 162.4 cut/past function
  // 146.8.1 void _addProduct(Product product) {
  //162.1 void addProduct(Product product) {
  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title, description: description, image: image, price: price); // 162.1
    /*146.5 setState(() {
      _products.add(product);
    }); */
    _products.add(product);
    // 150.7.1
    _selectedProductIndex = null;
    //155.2
    notifyListeners();
  } 162.4*/

  // 162.18 void updateProduct(Product product) {
    void updateProduct(String title, String description, String image, double price) {
    // 150.3.1 int index, Product product) {
    // 146.8.2
    /*146.6 setState(() {
      _products[index] = product;
    }); */
    // 162.19
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId
        ); // 162.19
    products[selectedProductIndex] // 150.3.1index]
        = updatedProduct;//162.20 product; 
    // 150.7.2    // 162.15 selectedProductIndex to selProductIndex
    selProductIndex = null;
    //155.2
    notifyListeners();
  }

  void deleteProduct() {
    // 150.3.2 int index) {
    // 146.8.3
    /*146.7 setState(() {
      _products.removeAt(index);
    }); */
    products.removeAt(selectedProductIndex); // 150.3.2 index);
    // 150.7.3    // 162.15 selectedProductIndex to selProductIndex
    selProductIndex = null;
    //155.2
    notifyListeners();
  }

  //150.2    // 162.15 selectedProductIndex to selProductIndex
  void selectProduct(int index) {
    selProductIndex = index;
    //155.2
    notifyListeners();
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
    products[selectedProductIndex] = updatedProduct;

    // 155.1
    notifyListeners(); //155.1

    //157    // 162.15 selectedProductIndex to selProductIndex
    selProductIndex = null;
  } // 153.2

  // 156.2
  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    // 156.10
    notifyListeners();
  }
} */

/*150.7 we should also unselect product whenever we add, update or delete a product. */

// 162.12 change _products to products it's not private here
