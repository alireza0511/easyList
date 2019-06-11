import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  // assignment 6.12
  final Map <String, dynamic> _formData = {
    'email' : null,
    'password' : null,
    'acceptTerms' : false
  };
  // String _emailValue = '';
  // String _passwordValue = '';
  // bool _acceotTerm = false;

  // assignment 6.2
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth =
        deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95; //117.2

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          // assignment 6
          child: Center(
              child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              // assignment 6.1
              child: Form(
                // assignment 6.3
                key: _formKey,
                child: Column(
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

                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      child: Text('Log in'),
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }

  void _submitForm() {
    // assignment 6.4
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    // assignment 6.5
    _formKey.currentState.save();

    print(_formData);
    
    Navigator.pushReplacementNamed(context, '/products');
  }

  SwitchListTile _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        // assignment 6.13 we still need set data here 
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  Widget _buildPasswordTextField() {
    // assignment 6.6
    return TextFormField(
      // assignment 6.7
      onSaved: (String value) {
        setState(() {
          _formData['password'] = value;
        });
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
          // assignment 6.8
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password is required and should be 6+ characters long.';
        }
      },
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/background.jpg'),
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  Widget _buildEmailTextField() {
    // assignment 6.9
    return TextFormField(
      // assignment 6.10
      onSaved: (String value) {
        setState(() {
          _formData['email'] = value;
        });
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
          // assignment 6.11
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter valid email address.';
        }
      },
    );
  }
}
