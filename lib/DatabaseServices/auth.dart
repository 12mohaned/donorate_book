import 'package:donorate_book/DatabaseServices/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:donorate_book/Model/models.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(
      FirebaseUser user, String username, String email, String password) {
    return user != null ? User(user.uid, username, email, password) : user;
  }

  Future register(String username, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DataBaseService(uid: user.uid).updateUserData(username, email);
      return _userFromFirebaseUser(user, username, email, password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future login(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result == null ? false : true;
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUser() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      return user.email;
    } catch (e) {
      print(e.toString());
    }
  }
}
