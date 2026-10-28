
class Book {
  String _title;
  String _author;
  double _rating = 0;

  // Обычный конструктор
  Book(this._title, this._author);

  // Именованный конструктор
  Book.withRating(this._title, this._author, double rating) {
    this.rating = rating;
  }

  // Getters
  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  // Сеттер с валидацией
  set rating(double value) {
    if (value >= 0 && value <= 10) {
      _rating = value;
    } else {
      print('Rating must be between 0 and 10.');
    }
  }

  //  Отобразить информацию о книге
  void displayInfo() {
    print('Title: $_title');
    print('Author: $_author');
    print('Rating: $_rating');
  }
}
