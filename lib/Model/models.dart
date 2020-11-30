class Book {
  String name;
  String info;
  List<Category> category;

  Book(String name, String info, List<Category> category) {
    this.name = name;
    this.info = info;
    this.category = category;
  }
}

class User {
  String _uid;
  String username;
  String email;
  String _password;
  User(String uid, String username, String email, String password) {
    this._uid = uid;
    this.username = username;
    this.email = email;
    this._password = password;
  }
}

class Donation {
  User user;
  Book book;
  Donation(User user, Book book) {
    this.user = user;
    this.book = book;
  }
}

enum Category { novel, university, school, others }
