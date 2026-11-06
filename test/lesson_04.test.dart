import 'dart:io';

void main() {
  int warm = 0;
  int cool = 0;
  int cold = 0;

  for (int i = 1; i <= 7; i++) {
    print('Enter temperature for the day:');
    int temperature = int.parse(stdin.readLineSync() ?? '0');

    if (temperature > 20) {
      print("It's warm today!");
      warm++;
    } else if (temperature >= 10) {
      print("It's cool today.");
      cool++;
    } else {
      print("It's cool day");
      cold++;
    }
  }
  
  print('Warm days: $warm');
  print('Cool days: $cool');
  print('Cold days: $cold');
  print('Weekly temperature analysis completed.');
}
