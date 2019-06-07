import 'package:flutter/material.dart';

// 111.1
class PriceTag extends StatelessWidget {
  // 111.3
  final String price;
  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return
        // 111.2 cut/past this to price_tag.dart folder
        Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5.0)),
            child: Text(
              //111.4
              '\$$price',
              style: TextStyle(color: Colors.white),
            ));
  }
}
