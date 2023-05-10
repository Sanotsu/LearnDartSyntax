import 'dart:math';

// Dart 语言并没有提供 interface 关键字，但是每一个类都隐式地定义了一个接口。
abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

// 虽然 CircleMock 并没有定义任何行为，但是在 Dart 中这是完全合法的，不会有任何报错。
class CircleMock implements Circle {
  late num area;
  late num radius;
}

main() {
  final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);
}
