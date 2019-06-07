import 'package:flutter/material.dart';
import 'package:my_course_app/widgets/products/address_tag.dart';
import 'package:my_course_app/widgets/products/price_tag.dart';
import 'package:my_course_app/widgets/ui_elements/title_defualt.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  // assignment 5
  final String description;
  final double price;
  // ProductPage(this.title, this.imageUrl);
  ProductPage(
      this.title, this.imageUrl, this.description, this.price); // assignment 5

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back btn tapped');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Product"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center, //assignment 5
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10),
              child:
                  /* 113.3 cut/past 
              Text(
                title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald'),
              ), */
                  TitleDefualt(title), // 113.3
            ),
            SizedBox(
              width: 8.0,
            ),
            buildAddressPriceRow(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),

            /* assignment 5 
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Back'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Delete'),
                  onPressed: () => _showWarningDialog(context)),
             ) assignment 5*/
          ],
        ),
      ),
    );
  }

  Widget buildAddressPriceRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*113.7 cut/past
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Text(
                  'Union Square, San Francisco',
                  style: TextStyle(color: Colors.grey, fontFamily: 'Oswald'),
                ),
              ), */
              AddressTag('Union Square, San Francisco'), //113.7
              SizedBox(
                width: 12.0,
              ),

              /*111.8 refactoring 
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  '\$${price.toString()}',
                  style: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
                ),
              ), 111.8*/
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
