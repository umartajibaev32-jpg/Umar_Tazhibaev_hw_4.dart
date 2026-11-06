void main() {
  print('Hello World!');
  print(44);
  print(12.45); // распечатка дробного числа

  // Комментарий

  /*
  Многострочне
  комментарии
  */

  // Переменные
  String myName = 'Jim Brown'; // строковый тип данных
  int myAge = 26; // целочисленный тип данных
  print(myName);
  print(myAge);
  print(2026 - myAge);

  myAge = 27;
  print(myAge);

  int salary = 2000;
  String job = 'Dart Developer';
  print(salary / 30);

  job = 'Senior Dart Developer';
  salary = salary + 1000;
  print(salary / 30);

  double myHeight = 180.5; // тип данных с плавающей точкой
  bool isTeacher = true; // логический тип данных

  String myPets1Name = 'Max';
  String myPets2Name = 'Buddy';
  // String 3myPetsName = 'Buddy'; // Ошибка: имя переменной не может начинаться с цифры
  // String my_pets_name = 'Buddy'; // Допустимо, но не принято в стиле Dart

  // Конкатенация и интерполяция строк
  print('My name is ' + myName + '. My job is ' + job + '.');
  print(
    'My age is $myAge. My salary is $salary. With out tax: ${salary - salary * 0.1}',
  );

  // Экранирование строк
  print("Today I'm learning Dart Programming");
  print('Today I am learning "Dart Programming"');
  print('Today I\'am learning "Dart Programming"');

  // Строковые функции
  String sampleString = '   Dart Programming   ';
  print(sampleString.length);
  print(sampleString.toUpperCase());
  print(sampleString.toLowerCase());
  print(sampleString.trim());
  print(sampleString.contains('Dart'));
  print(sampleString.contains('programming'));
  print(sampleString.replaceAll('Dart', 'Flutter'));

  // Арифметические операторы
  print(1 + 4);
  print(9 - 2);
  print(4 * 5);
  print(40 / 10);
  print(40 ~/ 10); // Целочисленное деление
  print(42 ~/ 10);

  print(5 + 3 * 4 / 6 - 1);
  print(5 + 3 * 4 / (6 - 1));

  print(42 % 10); // Остаток от деления

  
  // Особенности системы типов Dart (var, final)

  var number = 76; // Тип данных определяется автоматически -> int
  print(number + 4);

  var myCountry = 'Kyrgyzstan'; // Тип данных определяется автоматически -> String
  print(myCountry.toUpperCase());

  final double pi = 3.14;
  // pi = 43.2;

  // var -> значение может изменяться и тип определяется автоматически
  // final -> значение не может изменяться после инициализации, тип можно указать
}
