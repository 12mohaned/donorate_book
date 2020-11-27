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
            height: 3.5,
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
        body: Card(
            child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              book.info,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 50),
            RaisedButton.icon(
                onPressed: (() {}),
                icon: Icon(Icons.book),
                label: Text('book',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                color: Colors.green),
            SizedBox(height: 10),
            Text(
              'Donated by Mohaned',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ],
        )));
  }
}
