import 'package:flutter/material.dart';
/* 31.8  import from package related from our own files.*/
import './products.dart';

/* 31.2 : here I need extend a stateful widget because I have plan on managing 
my list of products and changinf it. */
class ProductManager extends StatefulWidget {
  /* 32.3  add constructor by repeating the class name and adding ().
Now we got the green squiggly lines that should be immutable class,
wait what, isn't it a stateful widget? Stateful widgets are all about having 
state where the data can change, right?
That's true but it changes in the state class not in the widget class, the two 
are linked together but it still is a technically separated object
So here we actually have to add final, starting product is something we receive 
from outside*/
  final String startingProduct;
  ProductManager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    // 31.6 return _ProductManagerState and instantiate it
    return _ProductManagerState();
  }
}

/* 31.3 we need to add a second class, the _ProductManagerState class which extends
state which is a generic type linking to ProductManager. */
class _ProductManagerState extends State<ProductManager> {
  /* 32.2 let's get rid of this dummy hard code and get from outside 
  // 31.5 : cut/past _product list from main.dart file
  List<String> _products = ['Food Tester']; 32.2*/
  List<String> _products = [];

/* 32.4 the problem is that we need startingProduct here but we just have it in
ProductManager class. no worry flutter does some behind the scenes work for you. 
That special property is named widget and it allows you to access the properties 
of your parent widget or of your connected widget, like startingProduct.
so you can access it in initState function .so when build runs for the first time,
that initState will already have been executed.*/
  @override
  void initState() {
    super.initState();
    // 32.4.1 add startingProduct to the product list
    _products.add(widget.startingProduct);
  }

  @override
  Widget build(BuildContext context) {
    /* 
    31.7 : because we want call our product widget here we add a column widget
    */
    return Column(
      children: [
        //31.4 : cut/past container widget from main.dart file
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
            child: Text('Add Product'),
          ),
        ), //31.4
        // 31.9 : add our product element after container
        Products(_products)
      ],
    );
  }
}
