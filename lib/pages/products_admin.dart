import 'package:flutter/material.dart';
import './products.dart';
import './product_edit.dart';
import './product_list.dart';
import '../models/product.dart';

class ProductsAdminPage extends StatelessWidget {
  /* 147.6 
  final Function addProduct;
  final Function deleteProdcut;
  final Function updateProduct;
  //145.9 final List<Map<String, dynamic>> products;
  final List<Product> products;

  ProductsAdminPage(
      this.addProduct, this.updateProduct, this.deleteProdcut, this.products); */
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'create product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'my product',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(/* 147.7 addProduct: addProduct */),
            ProductListPage(/* 147.7 products, updateProduct, deleteProdcut */),
          ],
        ),
      ),
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
            leading: Icon(Icons.shop),
            title: Text('Manage Products 2'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }
}
