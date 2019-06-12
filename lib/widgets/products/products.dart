import 'package:flutter/material.dart';
import 'package:my_course_app/widgets/products/product_card.dart';
import './price_tag.dart';
import '../../models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/products.dart';

class Products extends StatelessWidget {
  /* 147.3
  //145.7 final List<Map<String, dynamic>> products;
  final List<Product> products;

  Products(this.products) {
    print('E: [Products Widget] Constructor');
  } 147.3*/

  Widget //147.5 _buildProductList() {
      _buildProductList(List<Product> products) {
    // 147.5
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
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
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    //147.4.1 return _buildProductList();
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}

/* 147.4 here we need the products and this is now where the other part of 
the scoped model comes into
it will be called by the scoped model package whenever data in this model 
changes 
the second argument child we'll not really use that, it's essentially a child 
which will not get that model data and we can safely ignore this for now.*/
