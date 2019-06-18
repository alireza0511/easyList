// 112.1 refactoring
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/product.dart';
import 'package:my_course_app/widgets/products/address_tag.dart';
import 'package:my_course_app/widgets/products/price_tag.dart';
import 'package:my_course_app/widgets/ui_elements/title_defualt.dart';
import '../../scoped-models/products.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  //145.8 final Map<String, dynamic> product;
  final Product product;
  final int productIndex;
  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image), //['image']),
          SizedBox(
            height: 10.0,
          ),
          TitleDefualt(product.title), //['title']),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: Colors.blue,
            child: Text('margin space: ' + product.title), //['title']),
          ),
          _buildTitlePriceRow(),
          Row(
            children: <Widget>[
              Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(product.userEmail),
                  )),
              SizedBox(
                width: 8.0,
              ),
              Expanded(flex: 5, child: Text("expanded")),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          AddressTag('Union Square, San Francisco'),
          _buildActionsButton(context)
        ],
      ),
    );
  }

  ButtonBar _buildActionsButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info,
            size: 40.0,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
        // 154.1
        ScopedModelDescendant <MainModel>( // 160.6 <ProductsModel>(
          builder: (BuildContext context, Widget child, MainModel model) { // 160.6 ProductsModel model) {
            return //154.1
                IconButton(
              icon: Icon(
                // 154.3
                model.allProducts[productIndex].isFavorite //products[productIndex].isFavorite
                    ? Icons.favorite
                    : // 154.3
                    Icons.favorite_border,
              ),
              iconSize: 40.0,
              color: Colors.red,
              onPressed: () {
                // 154.2
                model.selectProduct(productIndex);
                model.toggleProductFavoriteStatus(); //154.2
              },
            );
          },
        )
      ],
    );
  }

  Container _buildTitlePriceRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'padding space: ' + product.title, //['title'],
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald'),
            ),
            SizedBox(
              width: 8.0,
            ),
            PriceTag(product.price.toString()) //['price'].toString())
          ],
        ));
  }
}
