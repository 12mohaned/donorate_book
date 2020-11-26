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
      return _userFromFirebaseUser(user, username, email, password);
    } catch (e) {
      print(e.toString());
    }
  }
}
