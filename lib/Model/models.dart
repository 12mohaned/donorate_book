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
  String username;
  String email;
  String _password;
  User(String username, String email, String _password) {
    this.username = username;
    this.email = email;
    this._password = _password;
  }
}

class Donor extends User {
  List<Book> _books;
  Donor(String username, String email, String password)
      : super(username, email, password);
}

enum Category { novel, university, school, others }
