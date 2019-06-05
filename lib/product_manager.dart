import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

// 80.4.1
class ProductManager extends StatelessWidget {
  // 80.4.2
  final List<Map<String,String>> products;
  final Function addProduct;
  final Function deleteProduct;

  //80.4.3
  ProductManager(this.products, this.addProduct, this.deleteProduct);


  @override
  Widget build(BuildContext context) {
    print('D: [ProductManager State] bulid()');

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        // 71.4
        // Expanded(child: Products(_products))
        Expanded(child: Products(products, deleteProduct: deleteProduct)) // 71.4
      ],
    );
  }
}
/* 80.4 we dont need stateful in here let's change it to stateless wedget 
class ProductManager extends StatefulWidget {
  // 70.5 string to map
  // final String startingProduct; // 70.5
  final Map startingProduct;

  ProductManager({this.startingProduct}) {
    print('A: [ProductManager Wedget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('B: [ProductManager Wedget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  // 70.4 change String to Map
  // List<String> _products = []; //70.4
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    super.initState();

    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }

    print('C: [ProductManager State] initState()');
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print(' [ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }
/*80.3 cut/copy 
  // 70.3 change argument to map hold more object
  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  // 71.3 create a delete function
  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  } // 71.3
  80.3 */

  @override
  Widget build(BuildContext context) {
    print('D: [ProductManager State] bulid()');

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        // 71.4
        // Expanded(child: Products(_products))
        Expanded(child: Products(_products, deleteProduct: _deleteProduct)) // 71.4
      ],
    );
  }
} 80.4*/
