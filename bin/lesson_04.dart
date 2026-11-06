// Hi sensei!

void main() {
  // DRY - don't repeat yourself
  print('ЗАВТРАК');
  makeTea();

  print('ОБЕД');
  makeTea();

  print('УЖИН');
  makeTea();

  addition(2, 5, 'Сумма');
  addition(10, 51, 'Результат сложения');

  calculatePerimeter('Аудитория 1', 5, 5.5);
  calculatePerimeter('Кухня', 4, 3.5);
  calculatePerimeter('Холл', 10, 12);

  int areaOfAuditory1 = calculateArea(5, 5.5);
  int areaOfKitchen = calculateArea(4, 3.5);
  int areaOfHall = calculateArea(10, 12);

  print('Площадь комнаты Аудитория 1: $areaOfAuditory1 кв.м.');
  print('Площадь комнаты Кухня: $areaOfKitchen кв.м.');
  print('Площадь комнаты Холл: $areaOfHall кв.м.');
  print('ОБЩЯЯ ПЛОЩАДЬ: ${areaOfAuditory1 + areaOfKitchen + areaOfHall} кв.м.');
  double shippingBishkek = calculateShipping(weight: 5, city: 'Бишкек');
  double shippingOsh = calculateShipping(
    weight: 2,
    pricePerKg: 150,
    city: 'Ош',
  );

  print('Цена доставки по Бишкеку: $shippingBishkek');
  print('Цена доставки до города Ош: $shippingOsh');

  print(globalVariable);
}

double calculateShipping({
  required String city,
  required double weight,
  int pricePerKg = 200,
}) {
  if (city.toLowerCase() == 'бишкек') {
    return weight * pricePerKg;
  } else {
    return weight * pricePerKg * 2;
  }
}

int calculateArea(double length, double width) {
  double area = length * width;
  return area.round();
}

void calculatePerimeter(String room, double length, double width) {
  double perimeter = (length + width) * 2;
  print('Периметр комнаты $room: $perimeter м.');
}

void addition(int num1, int num2, String phrase) {
  int result = num1 + num2;
  print('$phrase: $result');
}

void makeTea() {
  print('Вскипятить воду');
  print('Насыпать заварку');
  print('Залить кипятком');
  print('Дать настояться');
  print('Налить в чашку');
  print('Добавить молоко или сахар по-вкусу');
  finish();
}

void finish() {
  print('Процесс завершел');
}

String globalVariable = 'Я глобальная переменная';
void testScope(int paramVariable){
  print(globalVariable);
  print(paramVariable);
  // print(localVariable);
  int localVariable = 1;
  print(localVariable);
  if(paramVariable > 0){
    print(localVariable);
    double ifBlockVariable = 1.2;
    print(globalVariable);
  }
  // print(ifBlockVariable);
}