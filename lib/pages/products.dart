import 'package:flutter/material.dart';
import '../product_manager.dart';
import './products_admin.dart';
//assignment 2
import './products_admin1.dart';
//assignment 3
import './products_admin2.dart';
import '../product_manager.dart';

// 73.4 HomePage to ProductsPage
class ProductsPage extends StatelessWidget {
//92.15.3 String tp dynamic
  //80.7
  final List<Map<String, dynamic>> products;
  //92.2
  // final Function addProduct;
  // final Function deleteProduct; //92.2
  //92.1
  // 80.8
  // ProductsPage(this.products,this.addProduct,this.deleteProduct); /92.1
  ProductsPage(this.products);
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
                /* 78.3 now we can use route name for pushing 
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsAdminPage())); */
                Navigator.pushReplacementNamed(context, '/admin'); // 78.3
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
      // 80.9
      // body: ProductManager(), 80.9
      //92.3 body: ProductManager(products,addProduct,deleteProduct),
      body: ProductManager(products),
    );
  }
}
