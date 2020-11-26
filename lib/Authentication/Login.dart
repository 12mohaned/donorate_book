import 'package:donorate_book/DatabaseServices/auth.dart';
import 'package:flutter/material.dart';
import 'package:donorate_book/Home/home.dart';

String _email;
String _password;
final AuthService _auth = null;

class MyLoginForm extends StatefulWidget {
  @override
  LoginForm createState() {
    return LoginForm();
  }
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
Widget _buildEmail() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Email',
        icon: Icon(Icons.mail),
        labelText: 'Email',
      ),
      validator: (String value) => value.isEmpty |
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)
          ? 'Email is either empty or in wrong format'
          : null,
      onSaved: (String value) {
        _email = value;
      });
}

Widget _buildPassword() {
  return TextFormField(
      obscureText: true,
      decoration: new InputDecoration(
        hintText: 'Password',
        icon: Icon(Icons.vpn_key),
        labelText: 'Password',
      ),
      validator: (String value) =>
          value.isEmpty ? 'Password is required' : null,
      onSaved: (String value) {
        _password = value;
      });
}

class LoginForm extends State<MyLoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body: (Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildEmail(),
          _buildPassword(),
          SizedBox(height: 10.0, width: 12.0),
          new Container(
              child: new RaisedButton(
            child: const Text('Submit'),
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeApp()),
                // );
              } else {}
            },
          )),
        ],
      ),
    )));
  }
}
