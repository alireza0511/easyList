import 'package:flutter/material.dart';
//73.7
import './products.dart';

//73.2
class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Log in'),
          onPressed: () {
            // 73.8 we want replace login page by products page, replacement simply means the current page completely gets replaced with this one.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductsPage()),
            );
          },
        ),
      ),
    );
  }
}

//73.3 rename the home.dart to products.dart
