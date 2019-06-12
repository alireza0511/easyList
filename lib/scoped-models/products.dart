//146.2 import model
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

// 146.3 create a class for handel our model
class ProductsModel extends Model {
// 146.4 cut/past from main.dart
  List<Product> _products = [];

  // 150.1 we want to have index through our model
  int _selectedProductIndex;

  /* 146.9 getter method
  So since this would return a list, I actually want to return a copy of that
  so that I return a new list of products and not the existing one because again,
  only one instance of that would be stored in memory and now this would be a 
  pointer pointing at that value and this would essentially return a new 
  pointer. I can create a new list by using the built-in list class which 
  has a from constructor
  */
  List<Product> get products {
    return List.from(_products);
  }

//150.8
int get selectedProductIndex {
  return _selectedProductIndex;
}

//150.10
Product get selectedProduct {
  // 150.18
  if (_selectedProductIndex == null) {
    return null;
  }
  return _products[_selectedProductIndex];
}
  // 146.8.1 void _addProduct(Product product) {
  void addProduct(Product product) {
    /*146.5 setState(() {
      _products.add(product);
    }); */
    _products.add(product);
    // 150.7.1
    _selectedProductIndex = null;
  }

  void updateProduct(Product product){// 150.3.1 int index, Product product) {
    // 146.8.2
    /*146.6 setState(() {
      _products[index] = product;
    }); */
    _products[_selectedProductIndex]// 150.3.1index] 
    = product;
    // 150.7.2
    _selectedProductIndex = null;
  }

  void deleteProduct(){// 150.3.2 int index) {
    // 146.8.3
    /*146.7 setState(() {
      _products.removeAt(index);
    }); */
    _products.removeAt(_selectedProductIndex); // 150.3.2 index);
    // 150.7.3
    _selectedProductIndex = null;
  }

  //150.2 
  void selectProduct(int index){
    _selectedProductIndex = index;
  }
}

/*150.7 we should also unselect product whenever we add, update or delete a product. */