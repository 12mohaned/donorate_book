import 'package:donorate_book/DatabaseServices/auth.dart';
import 'package:donorate_book/Location/DonorLocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:donorate_book/Model/models.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:donorate_book/DatabaseServices/database.dart';

/* Returns the donation form to fill when dontaing a book

book name, book info, etc..
*/
class MyDonorForm extends StatefulWidget {
  @override
  DonorForm createState() {
    return DonorForm();
  }
}

String _bookName;
String _bookInfo;
bool _is_switch = false;
AuthService _auth = AuthService();
List<Category> _categories = [];
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
DataBaseService _db = new DataBaseService();
Widget _buildSelect() {
  return Container(
      color: Colors.green,
      child: (MultiSelect(
          autovalidate: false,
          titleText: 'title',
          validator: (value) {
            if (value == null) {
              return 'Please select one or more option(s)';
            }
            return null;
          },
          errorText: 'Please select one or more option(s)',
          dataSource: [
            {
              "display": "Novel",
              "value": 1,
            },
            {
              "display": "University",
              "value": 2,
            },
            {
              "display": "School",
              "value": 3,
            },
            {
              "display": "Others",
              "value": 4,
            }
          ],
          textField: 'display',
          valueField: 'value',
          filterable: true,
          required: true,
          value: null,
          onSaved: (value) {
            for (int i = 0; i < value.length; i++) {
              _categories.add(categoryType(value[i]));
            }
          })));
}

Category categoryType(int value) {
  switch (value) {
    case 1:
      return Category.novel;
    case 2:
      return Category.university;
    case 3:
      return Category.school;
      break;
    default:
      return Category.others;
  }
}

Widget _buildName() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Book Name',
        icon: Icon(Icons.library_books),
        labelText: 'Book Name',
      ),
      validator: (String value) =>
          value.isEmpty ? 'Book name is required' : null,
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
      validator: (String value) =>
          value.isEmpty ? 'Book info is required' : null,
      onSaved: (String value) {
        _bookInfo = value;
      });
}

class DonorForm extends State<MyDonorForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  onSwitchValueChanged(bool newVal) {
    setState(() {
      _is_switch = newVal;
    });
  }

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
          _buildSelect(),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Text('Donate Anonymously',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Switch(
              value: _is_switch,
              onChanged: (value) {
                onSwitchValueChanged(value);
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            )
          ]),
          SizedBox(height: 10.0, width: 12.0),
          new Container(
              child: new RaisedButton(
            child: const Text('Submit'),
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                if (_is_switch == false) {}

                String email = await _auth.getUser();

                Book(_bookName, _bookInfo, _categories);
                dynamic result = await _db.updateBookData(
                  _bookName,
                  _bookInfo,
                  email,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonorLocation()),
                );
              } else {}
            },
            color: Colors.green,
          )),
        ],
      ),
    )));
  }
}
