import 'package:flutter/material.dart';
import '../product_manager.dart';
import './products_admin.dart';
//assignment 2
import './products_admin1.dart';
//assignment 3
import './products_admin2.dart';

// 73.4 HomePage to ProductsPage
class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 66.3 cut/copy the from main.dart
    return Scaffold(
      // 74.1
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              // 74.2
              automaticallyImplyLeading: false, // 74.2

              title: Text('Choose'),
            ),
            ListTile(
              
              title: Text('Manage Products'),
              onTap: () {
                //assignment 2
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsAdmin()));
              },
            ),
            ListTile(
              
              title: Text('Manage Products 1'),
              onTap: () {
                //assignment 2
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsAdmin1()));
              },
            ),
            ListTile(
              
              title: Text('Manage Products 2'),
              onTap: () {
                //assignment 3
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsAdmin2()));
              },
            )
          ],
        ),
      ), // 74.1

      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(),
    );
  }
}
