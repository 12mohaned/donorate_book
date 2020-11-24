import 'package:flutter/material.dart';
import 'package:donorate_book/Model/models.dart';

/* Return the List of available books 
*/

class DonorCard extends StatelessWidget {
  final Book book;
  DonorCard(this.book);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Text(
        book.name,
        style: TextStyle(
            height: 5,
            fontSize: 25,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500),
      ),
      Center(
          child: (RaisedButton.icon(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Booking(book)),
                );
              }),
              icon: Icon(Icons.book),
              label: Text('Book'),
              color: Colors.lime)))
    ]));
  }
}

class Booking extends StatelessWidget {
  final Book book;
  Booking(this.book);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(book.name), backgroundColor: Colors.green),
        body: Center(
          child: Column(
            children: [
              Text(
                book.info,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              RaisedButton.icon(
                  onPressed: (() {}),
                  icon: Icon(Icons.book),
                  label: Text('book',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  color: Colors.white)
            ],
          ),
        ));
  }
}
