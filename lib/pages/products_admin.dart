import 'package:flutter/material.dart';
import './products.dart';
// 76.6
import './product_create.dart';
import './product_list.dart';

class ProductsAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //76.1 create drawer
        DefaultTabController(
      length: 2,
      child: //76.1
          Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                // 74.2
                automaticallyImplyLeading: false, // 74.2

                title: Text('Choose'),
              ),
              ListTile(
                title: Text('Manage Products 2'),
                onTap: () {
                  //assignment 3
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductsPage()));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Products'),
          // 76.2
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
          ), // 76.2
        ),
        /* 76.3 
        body: Center(
          child: Text('welcom to admin page'),
        ), 76.3*/
        body: TabBarView(
          children: <Widget>[
            // 76.7
            ProductCreatePage(),
            ProductListPage()
          ],
        ), //76.3
      ),
    );
  }
}
