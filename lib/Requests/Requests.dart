import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donorate_book/Model/models.dart';

List<User> userslist = [
  User('mohaned', 'mohaned_boss@outlook.com', 'Abc1234/'),
  User('mohamed', 'mohamed_boss@outlook.com', 'Abc12345/'),
  User('Amr', 'Amr.mashaly12@gmail.com', 'Abc123456/'),
  User('Wael', 'Wael.abosadat@gmail.com', 'Okay1234/'),
  User('Menna', 'Menna.wael12@gmail.com', 'Wael'),
  User('Slim', 'Slim.Abdenhadder2@gmail.com', 'Slim1234/'),
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
