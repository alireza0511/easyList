import 'package:flutter/material.dart';

import './products.dart';

class ProductsAdmin2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => ProductsPage()));
                        Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Admin Products 2'),
      ),
      body: Center(
        child: Text('welcom to admin page 2. assiognment 3'),
      ),
    );
  }
}