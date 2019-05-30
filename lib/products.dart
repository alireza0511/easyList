import 'package:flutter/material.dart';
/* 30.3 You can build this class in both ways however actually, the more elegant
 ways to use the stateless widget here and now this can be confusing because I 
 just said that this column card is the only thing which changes and that's 
 correct but the change of data actually happens somewhere else, you could argue.
 The products widget here just receives a list of products and that list might 
 be changed but it can be changed outside of that products widget.*/ 
class Products extends StatelessWidget {
  /* 30.5.1  this will allow us to pass data into products through its constructor,
   bind it to to products.
  30.5.3 it's a stateless widget and we specifically have to mark this property 
  as unchangeable.We do so by adding a 'final' keyword in front of it. 
  I means this value just set from the outside and if new data is passed in from 
  outside, it will simply replace the old value, not change it, replace it and 
  then call build again with the replaced value.*/
  final List<String> products;
  Products(this.products);

  @override
  Widget build(BuildContext context) {
    // 30.4 cut/past column widget from main.dart file
    return Column(
      // 30.5.2 remove under score from children: _products
      children: products
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
