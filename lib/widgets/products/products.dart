import 'package:flutter/material.dart';
import 'package:my_course_app/widgets/products/product_card.dart';
// import '../pages/product.dart';
import './price_tag.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print('E: [Products Widget] Constructor');
  }
/*112.6 redundent code 
  Widget _buildProductItem(BuildContext context, int index) {
    return 
    /*112.2 cut/past refactoring 
    Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          // 100.1 diffrenet type of space
          SizedBox(
            height: 10.0,
          ),
          Text(products[index]['title']),
          //100.2 diffrenet type of space
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: Colors.blue,
            child: Text('margin space: ' + products[index]['title']),
          ),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              color: Colors.green,
              child:
                  // 103.1 show in a row
                  Row(
                // 103.3
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'padding space: ' + products[index]['title'],
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
                        '\$${products[index]['price'].toString()}',
                        // 104.4
                        style: TextStyle(color: Colors.white),
                      )
                      ), 111.2*/
                      // 111.5 refactor the code
                      PriceTag(products[index]['price'].toString())
                  // 103.2 show price in row
                ],
              )),
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
          // 105.1
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Text('Union Square, San Francisco'),
          ),

          ButtonBar(
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
                    context, '/product/' + index.toString()),
              ),

              //110.2
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                ),
                iconSize: 40.0,
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
              )
            ],
          )
        ],
      ), 
    )112.2*/;
  } 112.6*/

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        //112.7
        // itemBuilder: _buildProductItem,
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index), //112.7
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
    return _buildProductList();
  }
}
