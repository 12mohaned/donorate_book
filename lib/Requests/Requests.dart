import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donorate_book/Model/models.dart';

List<User> userslist = [
  User('UI!12321', 'mohaned', 'mohaned_boss@outlook.com', 'Abc1234/'),
  User('UI!12322', 'mohamed', 'mohamed_boss@outlook.com', 'Abc12345/'),
  User('UI!12323', 'Amr', 'Amr.mashaly12@gmail.com', 'Abc123456/'),
  User('UI!12324', 'Wael', 'Wael.abosadat@gmail.com', 'Okay1234/'),
  User('UI!12325', 'Menna', 'Menna.wael12@gmail.com', 'Wael'),
  User('UI!12326', 'Slim', 'Slim.Abdenhadder2@gmail.com', 'Slim1234/'),
];

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: <Widget>[
      Center(
          child: (Text(
        user.username,
        style: TextStyle(
            height: 3,
            fontSize: 23,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ))),
      Expanded(
          child: Center(
              child: RaisedButton.icon(
        onPressed: (() {}),
        icon: Icon(Icons.info),
        label: Text('Info'),
        color: Colors.lime,
      )))
    ]));
  }
}

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userslist.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return UserCard(userslist[index]);
        });
  }
}
