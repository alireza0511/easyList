import 'package:flutter/material.dart';
import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProdcut;
  //130.2 ProductsAdminPage(this.addProduct, this.deleteProdcut);
  final List<Map<String, dynamic>> products;
  ProductsAdminPage(this.addProduct, this.deleteProdcut, this.products); //130.2

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
            ProductCreatePage(addProduct),

             // 130.3 ProductListPage()
              ProductListPage(products) //130.3
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
