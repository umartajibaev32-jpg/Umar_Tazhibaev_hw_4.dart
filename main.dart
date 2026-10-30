
class Person {
  String fullName;
  int age;
  bool isMarried;

  Person(this.fullName, this.age, this.isMarried);

  void introduce() {
    print(
      "Hi! My name is $fullName. "
      "I am $age years old. "
      "Married: ${isMarried ? 'Yes' : 'No'}.",
    );
  }
}

// Enum Subject
enum Subject { math, physics, english, history }

// Student наследуется от Person
class Student extends Person {
  Map<Subject, double> marks;

  Student(
    String fullName,
    int age,
    bool isMarried,
    this.marks,
  ) : super(fullName, age, isMarried);

  // Показывает оценки
  void showMarks() {
    print('Student: $fullName');

    for (var entry in marks.entries) {
      print('${entry.key.name}: ${entry.value}');
    }
  }

  // Считает среднюю оценку
  double calculateAverage() {
    if (marks.isEmpty) {
      return 0.0;
    }

    double sum = 0;

    for (var mark in marks.values) {
      sum += mark;
    }

    return sum / marks.length;
  }
}

void main() {
  // Создаём человека
  Person person = Person('Alice Johnson', 30, true);
  person.introduce();

  print('');

  // Создаём студента
  Student student = Student(
    'Adam White',
    20,
    false,
    {
      Subject.math: 90,
      Subject.physics: 85,
      Subject.english: 92,
      Subject.history: 89,
    },
  );

  // Информация о студенте
  student.introduce();

  print('');

  // Показываем оценки
  student.showMarks();

  print('');

  // Средняя оценка
  print('Average mark: ${student.calculateAverage()}');
}
