import 'book.dart';

void main() {
  Book book1 = Book('Harry Potter', 'J.K. Rowling');
  book1.rating = 9.5;
  book1.displayInfo();

  print('');

  Book book2 = Book.withRating(
    'The Hobbit',
    'J.R.R. Tolkien',
    9.0,
  );
  book2.displayInfo();

  print('');

  book1.rating = 11;
  book1.displayInfo();
}
