  import 'book.dart';
  import 'library.dart';

  void main() {
    // Книга 1: обычный конструктор
    Book book1 = Book('Harry Potter', 'J.K. Rowling');

    // Книга 2: именованный конструктор
    Book book2 = Book.withRating(
      'The Hobbit',
      'J.R.R. Tolkien',
      9.0,
    );

    // Книга 3: установка рейтинга с помощью сеттера
    Book book3 = Book('Sherlock Holmes', 'Arthur Conan Doyle');
    book3.rating = 8.5;

    // Отображение информации о книге
    book1.displayInfo();
    print('');

    book2.displayInfo();
    print('');

    book3.displayInfo();
    print('');

    // Создать библиотеку
    Library cityLib = Library('City Library');

  // Добавить книги в библиотеку
    cityLib.addBook(book1);
    cityLib.addBook(book2);
    cityLib.addBook(book3);

    // Отобразить библиотечные книги
    cityLib.showBooks();

  // Вывести общее количество книг
    print('Total books in library: ${cityLib.totalBooks}');
  }
