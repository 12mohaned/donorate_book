class Book {
  String name;
  String info;
  Category category;

  Book(String name, String info, Category category) {
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

class Donor extends User {
  List<Book> _books;
  Donor(String uid, String username, String email, String password)
      : super(uid, username, email, password);
}

enum Category { novel, university, school, others }
