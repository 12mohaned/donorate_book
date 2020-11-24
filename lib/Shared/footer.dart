import 'package:flutter/material.dart';

/*
a Folder with Shared Widgets across the App
 */

Widget footer = (BottomNavigationBar(
  backgroundColor: Colors.blue,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.green),
      title: Text('Home', style: TextStyle(color: Colors.black)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people, color: Colors.green),
      title: Text('Requests', style: TextStyle(color: Colors.black)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_books, color: Colors.green),
      title: Text('your books', style: TextStyle(color: Colors.black)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add, color: Colors.green),
      title: Text('Donate', style: TextStyle(color: Colors.black)),
    )
  ],
));
