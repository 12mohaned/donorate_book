import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:donorate_book/Authentication/Login.dart';
import 'package:donorate_book/Authentication/Signup.dart';
import 'package:donorate_book/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Registeration',
        home: Scaffold(
          appBar: AppBar(
              title: Text('Registeration Form'), backgroundColor: Colors.green),
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/book_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: (Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Register('Register'),
                SizedBox(height: 28.0, width: 15.0),
                Login('Login'),
              ],
            )),
          ),
        ));
  }
}

class Register extends StatelessWidget {
  final String persona;
  const Register(this.persona);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.green),
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: CupertinoButton(
            child: Text(persona,
                style: TextStyle(
                  color: Colors.black,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySignupForm()),
              );
            },
          ),
        ));
  }
}

class Login extends StatelessWidget {
  final String persona;
  const Login(this.persona);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.green),
        child: Padding(
          padding: const EdgeInsets.all(0.7),
          child: CupertinoButton(
            child: Text(persona,
                style: TextStyle(
                  color: Colors.black,
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyLoginForm()),
              );
            },
          ),
        ));
  }
}
