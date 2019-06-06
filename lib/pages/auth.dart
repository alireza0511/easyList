import 'package:flutter/material.dart';
//73.7
import './products.dart';

// for assignment 4 we change to sataeful widget
class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue = '';
  String _passwordValue = '';
  // 95.3
  bool _acceotTerm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _passwordValue = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              /* 95.1
              Switch(
                value: true,
                onChanged: (bool value) {},
              ),95.1*/
              // 95.2
              SwitchListTile(
                // 95.3.2
                value: _acceotTerm,
                onChanged: (bool value) {
                  //95.3.3
                  setState(() {
                    _acceotTerm = value;
                  });
                },
                title: Text('Accept Terms'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Log in'),
                onPressed: () {
                  print(_emailValue);
                  print(_passwordValue);
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          )),
    );
  }
}
/* assignment 4 
//73.2
class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(),
              TextField(),
              RaisedButton(
                child: Text('Log in'),
                onPressed: () {
                  /*81.2 
            // 73.8 we want replace login page by products page, replacement simply means the current page completely gets replaced with this one.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductsPage()),
            ); 81,2*/
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          )),
    );
  }
} assignment 4*/

//73.3 rename the home.dart to products.dart
