import 'package:flutter/material.dart';

// 145.1 create model
class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  //153.1 
  final bool isFavorite;
  // 162.2
  final String userEmail;
  final String userId; 

  Product(
      {@required this.title,
      @required this.description,
      @required this.price,
      @required this.image,
      // 162.2
      @required this.userEmail,
      @required this.userId,
      //153.1
      this.isFavorite = false});
}
