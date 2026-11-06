
abstract class Switchable {
  void turnOn();
  void turnOff();
}

abstract class Adjustable {
  void increase();
  void decrease();
}

mixin BatteryPowered {
  int batteryLevel = 100;

  void showBattery() {
    print('Battery level: $batteryLevel%');
  }
}

abstract class Device implements Switchable {
  final String name;

  Device(this.name);

  void showInfo() {
    print('Device: $name');
  }
}

class SmartLamp extends Device
    with BatteryPowered
    implements Adjustable {
  int brightness = 50;

  SmartLamp(String name) : super(name);

  @override
  void turnOn() {
    print('Lamp $name is ON');
  }

  @override
  void turnOff() {
    print('Lamp $name is OFF');
  }

  @override
  void increase() {
    brightness = (brightness + 10).clamp(0, 100);
  }

  @override
  void decrease() {
    brightness = (brightness - 10).clamp(0, 100);
  }

  @override
  void showInfo() {
    print('Lamp: $name, Brightness: $brightness%');
  }
}

class SmartSpeaker extends Device
    with BatteryPowered
    implements Adjustable {
  int volume = 50;

  SmartSpeaker(String name) : super(name);

  @override
  void turnOn() {
    print('Speaker $name is ON');
  }

  @override
  void turnOff() {
    print('Speaker $name is OFF');
  }

  @override
  void increase() {
    volume = (volume + 5).clamp(0, 100);
  }

  @override
  void decrease() {
    volume = (volume - 5).clamp(0, 100);
  }

  @override
  void showInfo() {
    print('Speaker: $name, Volume: $volume%');
  }
}

class SmartThermostat extends Device {
  int temperature = 22;

  SmartThermostat(String name) : super(name);

  @override
  void turnOn() {
    print('Thermostat $name is ON');
  }

  @override
  void turnOff() {
    print('Thermostat $name is OFF');
  }

  @override
  void showInfo() {
    print('Thermostat: $name, Temperature: $temperature°C');
  }
}

void main() {
  List<Device> devices = [
    SmartLamp('Living Room Lamp'),
    SmartSpeaker('JBL Speaker'),
    SmartThermostat('Home Thermostat'),
  ];

  for (var device in devices) {
    device.showInfo();

    device.turnOn();

    if (device is Adjustable) {
    (device as Adjustable).increase();
      device.showInfo();
    }

    if (device is BatteryPowered) {
      (device as BatteryPowered).showBattery();
    }

    print('');
  }

  print('All devices processed.');
}
