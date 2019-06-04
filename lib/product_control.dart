import 'package:flutter/material.dart';

/* 37.2 It will be a stateless widget because all I want to do is I want to display that 
button, it will not even receive any external data, it will really just render this button statically*/
class ProductControl extends StatelessWidget {

  //37.9
    final Function addProduct;
    ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    // 37.3 cut/past RaisedButton from product_manager.dart file
    return 
          RaisedButton(
            //35.2
            color: Theme.of(context).primaryColor,
            onPressed: () {
              /* 37.7 cut/past setState to product_manager.dart file
              setState(() {
                _products.add('Advanced Food Tester');
              }); */
              //37.10
              addProduct('Sweets');
            },
            child: Text('Add Product'),
          ); // 37.3
  }

}

