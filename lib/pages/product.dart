import 'package:flutter/material.dart';
import 'package:my_course_app/models/product.dart';
import 'package:my_course_app/widgets/products/address_tag.dart';
import 'package:my_course_app/widgets/products/price_tag.dart';
import 'package:my_course_app/widgets/ui_elements/title_defualt.dart';
import '../scoped-models/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class ProductPage extends StatelessWidget {
  /*149.1
  final String title;
  final String imageUrl;
  // assignment 5
  final String description;
  final double price;
  // ProductPage(this.title, this.imageUrl);
  ProductPage(
      this.title, this.imageUrl, this.description, this.price); // assignment 5 */

  final int productIndex;
  ProductPage(this.productIndex); //149.1

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back btn tapped');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child:
          // 149.2 for fetch data from scoped model
          ScopedModelDescendant<MainModel>( // 160.8  <ProductsModel>(
        builder: (BuildContext context, Widget chile, MainModel model) { // 160.8 ProductsModel model) {
          // 149.3.1 get current product from model
          final Product products = model.allProducts[productIndex];//model.products[productIndex]; // 149.3.1

          return //149.2
              Scaffold(
            appBar: AppBar(
              title: Text("Detail Product"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center, //assignment 5
              children: <Widget>[
                Image.asset(products.image),//149.3.2imageUrl),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TitleDefualt(products.title),//149.3.3 title),
                ),
                SizedBox(
                  width: 8.0,
                ),
                //149.3.4 buildAddressPriceRow(),
                buildAddressPriceRow(products.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    //149.3.3 description,
                    products.description,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AddressTag('Union Square, San Francisco'),
        SizedBox(
          width: 12.0,
        ),
        PriceTag(price.toString())
      ],
    );
  }

//83.2 create a alert dialog
  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }
}
