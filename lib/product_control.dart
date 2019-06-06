/*92.9  we dont need this file any more because we moved to creat page 
import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

    final Function addProduct;
    ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return 
          RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              // 70.6 we need to pass a map
              // addProduct('Sweets'); 
              addProduct({'title': 'Chocolate', 'image': 'assets/food.jpg'}); // 70.6
            },
            child: Text('Add Product'),
          ); 
  }

}
92.9*/
