// 使用可选参数（而不是使用重载）
import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;
  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';

  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});
}

main() {
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
}
