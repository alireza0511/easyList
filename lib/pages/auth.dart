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
        //107.1
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ), //107.1
        // 107.2 change margin to padding
        padding: EdgeInsets.all(10.0),
        /* 108.1 we want make our textField center so we ListView widget is not a
           good idea because it use all page
          child: ListView( */
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // 108.1
              children: <Widget>[
                _buildEmailTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildPasswordTextField(),
                /* 95.1
              Switch(
                value: true,
                onChanged: (bool value) {},
              ),95.1*/
                // 95.2
                _buildAcceptSwitch(),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Log in'),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    print(_emailValue);
    print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  SwitchListTile _buildAcceptSwitch() {
    return SwitchListTile(
      // 95.3.2
      value: _acceotTerm,
      onChanged: (bool value) {
        //95.3.3
        setState(() {
          _acceotTerm = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          // 108.2.2
          filled: true,
          fillColor: Colors.white),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/background.jpg'),
        // 107.3
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  TextField _buildEmailTextField() {
    return TextField(
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email',
          // 108.2.1
          filled: true,
          fillColor: Colors.white),
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
