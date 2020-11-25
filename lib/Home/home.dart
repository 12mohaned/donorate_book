import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donorate_book/Model/models.dart';
import 'package:donorate_book/Donor/DonorForm.dart';
import 'package:footer/footer_view.dart';
import 'package:donorate_book/Donor/Donors.dart';
import 'package:donorate_book/Requests/Requests.dart';

class HomeApp extends StatefulWidget {
  @override
  Home createState() {
    return Home();
  }
}

List<Book> books = [
  Book(
      'Outliers',
      'The Story of Success is the third non-fiction book written by Malcolm Gladwell and published by Little, Brown and Company on November 18, 2008. In Outliers, Gladwell examines the factors that contribute to high levels of success',
      Category.novel),
  Book(
      'Ethics',
      'Aristotle conceives of ethical theory as a field distinct from the theoretical sciences. Its methodology must match its subject matter—good action—and must respect the fact that in this field many generalizations hold only for the most part.',
      Category.university),
  Book(
      'Power of habit',
      'The Power of Habit: Why We Do What We Do in Life and Business is a book by Charles Duhigg, a New York Times reporter, published in February 2012 by Random House. It explores the science behind habit creation and reformation. The book reached the best seller list for The New York Times, Amazon.com, and USA Today.',
      Category.others),
  Book(
      'Oliver Twist',
      'Oliver Twist; or, the Parish Boy second novel, and was published as a serial from 1837 to 1839 and released as a three-volume book in 1838, before the serialization ended. The story centres on orphan Oliver Twist, born in a workhouse and sold into apprenticeship with an undertaker.',
      Category.novel),
  Book(
      'The plague',
      'The Black Death (also known as the Pestilence, the Great Mortality, or the Plague)[a] was the deadliest pandemic recorded in human history. The Black Death resulted in the deaths of up to 75–200 million[1][2][3][4][5][6] people in Eurasia and North Africa,[7] peaking in Europe from 1347 to 1351. Plague, the disease, was caused by the bacterium Yersinia pestis.[8] The Y. pestis infection most commonly results in bubonic plague, but can also cause septicaemic or pneumonic plagues',
      Category.novel),
];
Widget donor = (ListView.builder(
    itemCount: books.length,
    itemBuilder: (BuildContext ctxt, int index) {
      return DonorCard(books[index]);
    }));

class Home extends State<HomeApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    donor,
    UserList(),
    Text('Bello'),
    Text('cello'),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Donation Book'), backgroundColor: Colors.green),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lime,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Requests', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, color: Colors.black),
            title: Text('your books', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            title: Text('Donate', style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
