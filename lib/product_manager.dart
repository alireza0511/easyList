import 'package:flutter/material.dart';
/* 31.8  import from package related from our own files.*/
import './products.dart';
//37.4
import './product_control.dart';

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
  /* 36.1 if you want to target the arguments by name wrap by {}
  ProductManager(this.startingProduct) { //36.1
  36.3 also we can add defualt to our argument*/
  /* 60.3 ProductManager({this.startingProduct = 'Sweets Tester'}) { 60.3*/
  ProductManager({this.startingProduct}) {
    // 34.4
    print('A: [ProductManager Wedget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    // 34.5
    print('B: [ProductManager Wedget] createState()');
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
    // 60
    if (widget.startingProduct != null) {
      // 32.4.1 add startingProduct to the product list
      _products.add(widget.startingProduct);
    }
    // 34.6
    print('C: [ProductManager State] initState()');
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    // 34.7
    print(' [ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  /*37.6  we need concept called lifting the state up,we want to manage the state in a 
widget which has access to all the widgets that either change it like the product control 
or require the widget state, the data we're changing, the products widget in our case.
So the product manager is the connecting widget which reaches out to all these widgets 
that do change or need the state. 
Now how can I pass the information that this button was pressed in the product control 
up to the product manager? so let add _addProduct func*/
  void _addProduct(String product) {
    // 37.7 cut/past setState from product_control.dart file
    setState(() {
      _products.add(product);
    }); //37.7
  }

  @override
  Widget build(BuildContext context) {
    // 34.8
    print('D: [ProductManager State] bulid()');

    /* 
    31.7 : because we want call our product widget here we add a column widget
    */
    return Column(
      children: [
        //31.4 : cut/past container widget from main.dart file
        Container(
          margin: EdgeInsets.all(10.0),
          child:
              /* 37.3 cut/past RaisedButton to product_control.dart file
          RaisedButton(
            //35.2
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
            child: Text('Add Product'),
          ), 37.3 */
              /* 37.8
              // 37.5
              ProductControl(), */
              ProductControl(_addProduct),
        ), //31.4
        /* 58.2 for showing a listview we can use a Container with specific height 
        // 31.9 : add our product element after container
        Products(_products) 58.2*/
        /* 58.3 or for listview use a expanded wedget
        Container(height: 300.0, child: Products(_products)) 58.3 */
        Expanded(child: Products(_products))
      ],
    );
  }
}
