// 112.1 refactoring
import 'package:flutter/material.dart';
import 'package:my_course_app/widgets/products/address_tag.dart';
import 'package:my_course_app/widgets/products/price_tag.dart';
import 'package:my_course_app/widgets/ui_elements/title_defualt.dart';

class ProductCard extends StatelessWidget {
  // 112.3
  final Map<String, dynamic> product;
  final int productIndex;
  ProductCard(this.product, this.productIndex); // 112.3

  @override
  Widget build(BuildContext context) {
    return //112.2 cut/past refactoring
        Card(
      child: Column(
        children: <Widget>[
          // 112.4 products[index] to product
          Image.asset(product['image']),
          // 100.1 diffrenet type of space
          SizedBox(
            height: 10.0,
          ),

          //113.5 Text(product['title']),
          TitleDefualt(product['title']),
          //100.2 diffrenet type of space
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: Colors.blue,
            child: Text('margin space: ' + product['title']),
          ),
          _buildTitlePriceRow(),
          Row(
            children: <Widget>[
              // 106.3
              //100.3 diffrenet type of space
              Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('space padding: '),
                  )), // 106.1
              SizedBox(
                width: 8.0,
              ),
              // 106.2
              Expanded(flex: 5, child: Text("expanded")),
            ],
          ),

          SizedBox(
            height: 12.0,
          ),

          /* 113.8
          // 105.1
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text('Union Square, San Francisco'),
          ), */
          AddressTag('Union Square, San Francisco'), //113.8

          _buildActionsButton(context)
        ],
      ),
    ); // 112.2
  }

  ButtonBar _buildActionsButton(BuildContext context) {
    return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            //110.1
            // FlatButton( 110.1
            IconButton(
              // 110.1 child: Text('Details'),
              icon: Icon(
                Icons.info,
                size: 40.0,
                color: Theme.of(context).accentColor,
              ),
              //iconSize: 20.0,
              onPressed: () => Navigator.pushNamed<bool>(
                  //112.5 index tp productIndex
                  context,
                  '/product/' + productIndex.toString()),
            ),

            //110.2
            IconButton(
              icon: Icon(
                Icons.favorite_border,
              ),
              iconSize: 40.0,
              color: Colors.red,
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/' + productIndex.toString()),
            )
          ],
        );
  }

  Container _buildTitlePriceRow() {
    return Container(
            padding: EdgeInsets.only(top: 10.0),
            color: Colors.green,
            child:
                // 103.1 show in a row
                Row(
              // 103.3
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'padding space: ' + product['title'],
                  // 102.1
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                  //102.2 we need to add Oswald-Bold.ttf font file to the app lets go to pubspec.yami file
                ),
                SizedBox(
                  width: 8.0,
                ),
                /* 111.2 cut/past this to price_tag.dart folder 
                /* 104.2
                //104.1
                DecoratedBox( */
                Container(
                    // 104.2
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        // 104.3
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      // 104.5
                      '\$${product['price'].toString()}',
                      // 104.4
                      style: TextStyle(color: Colors.white),
                    )
                    ), 111.2*/
                // 111.5 refactor the code
                PriceTag(product['price'].toString())
                // 103.2 show price in row
              ],
            ));
  }
}
