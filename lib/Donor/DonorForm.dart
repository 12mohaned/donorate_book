import 'package:flutter/material.dart';

class MyDonorForm extends StatefulWidget {
  @override
  DonorForm createState() {
    return DonorForm();
  }
}

String _bookName;
String _bookInfo;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
Widget _buildName() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Book Name',
        icon: Icon(Icons.mail),
        labelText: 'Book Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Book name' + ' is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _bookName = value;
      });
}

Widget _buildInfo() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'About the book',
        icon: Icon(Icons.info_outline),
        labelText: 'About the book',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Book info' + ' is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _bookInfo = value;
      });
}

class DonorForm extends State<MyDonorForm> {
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
          _buildInfo(),
          SizedBox(height: 10.0, width: 12.0),
          new Container(
              child: new RaisedButton(
            child: const Text('Submit'),
            onPressed: () {
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
