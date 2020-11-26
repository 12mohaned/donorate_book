import 'package:flutter/material.dart';
import 'package:donorate_book/DatabaseServices/auth.dart';

String _name;
String _password;
String _email;
final AuthService _auth = AuthService();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class MySignupForm extends StatefulWidget {
  @override
  SignupForm createState() {
    return SignupForm();
  }
}

Widget _buildName() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Name',
        icon: Icon(Icons.person),
        labelText: 'Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name' + ' is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      });
}

Widget _buildEmail() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Email',
        icon: Icon(Icons.mail),
        labelText: 'Email',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email' + ' is Required';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Email Format is not correct';
        }
        return null;
      },
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
          value.isEmpty ? 'Password is Required' : null,
      onSaved: (String value) {
        _password = value;
      });
}

class SignupForm extends State<MySignupForm> {
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
          _buildName(),
          _buildEmail(),
          _buildPassword(),
          SizedBox(height: 10.0, width: 12.0),
          new Container(
              child: new RaisedButton(
            child: const Text('Submit'),
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                print(_auth);
                dynamic result = await _auth.register(_name, _email, _password);
                print(result == null);
              } else {}
            },
          )),
        ],
      ),
    )));
  }
}
