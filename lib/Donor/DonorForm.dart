import 'package:flutter/material.dart';
import 'package:donorate_book/Model/models.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

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
Donation _donation;
List<Category> _categories = [];
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

Widget _buildSelect() {
  return MultiSelect(
      autovalidate: false,
      titleText: 'title',
      validator: (value) {
        if (value == null) {
          return 'Please select one or more option(s)';
        }
      },
      errorText: 'Please select one or more option(s)',
      dataSource: [
        {
          "display": "Australia",
          "value": 1,
        },
        {
          "display": "Canada",
          "value": 2,
        },
        {
          "display": "India",
          "value": 3,
        },
        {
          "display": "United States",
          "value": 4,
        }
      ],
      textField: 'display',
      valueField: 'value',
      filterable: true,
      required: true,
      value: null,
      onSaved: (value) {
        print('The value is $value');
      });
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
            onPressed: () {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                _donation = Donation(
                    User('1000', 'Mohaned Mashaly',
                        'mohaned.mashaly12@gmail.com', 'tarek12/'),
                    Book(
                        'Outliers',
                        'The Story of Success is the third non-fiction book written by Malcolm Gladwell and published by Little, Brown and Company on November 18, 2008. In Outliers, Gladwell examines the factors that contribute to high levels of success',
                        Category.novel));
                print(_donation.book.name);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeApp()),
                // );
              } else {}
            },
            color: Colors.green,
          )),
        ],
      ),
    )));
  }
}
