import 'package:flutter/material.dart';
import './products_admin.dart';
import './products_admin1.dart';
import './products_admin2.dart';
import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {
  /*147.2 
  //145.6 final List<Map<String, dynamic>> products;
  final List<Product> products;0,
  ProductsPage(this.products); 147.2*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: Products(/*products*/),
    );
  }

  Drawer _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          ListTile(
            title: Text('Manage Products 1'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsAdmin1()));
            },
          ),
          ListTile(
            title: Text('Manage Products 2'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsAdmin2()));
            },
          )
        ],
      ),
    );
  }
}
