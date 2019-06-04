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
  /* 36.4 optional arguments for positional arguments.
  and also we have to add the const keyword here which means this is a list which can't 
  be changed

  Products(this.products) { 36.4*/
  Products([this.products = const []]) {
    // 34.2
    print('E: [Products Widget] Constructor');
  }

  // 59.2 creat this wedget to make our recycler view work
  Widget _buildProductItem(BuildContext context, int index) {
    // 59.3 cut/past Card wedget from build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          // 59.4
          Text(products[index])
        ],
      ),
    );
  }

// 61.4 let extract every thing in one function
  Widget _buildProductList() {
    // 61.5 cut/past
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
      /* collection view
      productCard = GridView.builder(itemBuilder: _buildProductItem,
      itemCount: products.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),); */
    } else {
      productCard = Center(
        child: Text('No products found, please add some'),
      );

      /* 62.1 if we dont want anything to show
      productCard = Container(); */
    }
    return productCard; // 61.5
  }

  @override
  Widget build(BuildContext context) {
    /*61.5 cut/past 
    // 61.1
    Widget productCard;
    // 61.2
    if (products.length > 0) {
      productCard = ListView.builder(
        // 59.5 the item we need is a card wedget
        itemBuilder: _buildProductItem,
        // 59.6 the count of array
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No products found, please add some'),
      );
    }
    // 34.3
    print('F: [Products Widget] build()');

    return
        /* 61.3  
    //60.2.1
    products.length > 0 ?
    /* 59.1 how use a some sort of recycler viewer
    /* 58.1 create listView 
    // 30.4 cut/past column widget from main.dart file
    Column( 58.1*/
    ListView(
      // 30.5.2 remove under score from children: _products
      children: products
          .map( // 59.3 cut/past the Card wedget to _buildProductItem()
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element)
                    ],
                  ),
                ), // 59.3
          )
          .toList(),
    ); 59.1*/ //we need to use listView.builder this behavior like recyclerview and adapter
    ListView.builder(
      // 59.5 the item we need is a card wedget
      itemBuilder: _buildProductItem ,
      // 59.6 the count of array
      itemCount: products.length,
    ) 
    // 60.2.2
    : Center(child: Text('No products found, please add some'),)
    ; */
        productCard; 61.5*/
        return _buildProductList();
  }
}
