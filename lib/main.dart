import 'package:flutter/material.dart';
import './product_manager.dart';
import 'package:flutter/rendering.dart';
/* 73.5 
// 66.4
import './pages/products.dart'; 73.5*/
import './pages/auth.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData(
        
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      home: 
      /* 66.3 cut/copy the from main.dart
      Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        /* 32.5 now we can pass our value to statful widget here 
        //31.14 let's call ProductManager as body of scaffold widget, create an object based on it by adding parentheses.
        body: ProductManager(), 32.5*/
        /* 36.2 
        body: ProductManager('Food Tester'), 36.2*/
        /* 60.3
        body: ProductManager(startingProduct:'Food Tester'), */
        body: ProductManager(),
      ), 66.3 */ 
      /* 73.6 use auth pas as defualt starting page
      // 66.5
      HomePage(), 73.6*/
      AuthPage(),
    );
  }
}

// 66.1 because we want navigate to other pages so we create "pages" subfolder
// 66.2 create home.dart file in pages subfolder
// 67.2 create deatil page product.dart
// 73.1 How If we want to push a new page but replace the existing one like auth page. So let's make auth.dart file
// 74 Adding the Slidedrawer