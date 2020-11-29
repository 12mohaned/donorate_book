import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});
  final CollectionReference usercollection =
      Firestore.instance.collection('Users');
  final CollectionReference bookscollection =
      Firestore.instance.collection('Books');

  Future<void> updateUserData(String username, String email) async {
    return await usercollection
        .document(uid)
        .setData({'Email': email, 'username': username});
  }
}
