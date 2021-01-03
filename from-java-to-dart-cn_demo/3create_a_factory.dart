// 在 Java 中工厂类是一个广泛使用的设计模式，它相比较直接对类进行实例化来说，具有诸多优势，
// 比如隐藏实例化的具体细节，提供可以配置为其他类的能力，直接返回一个已有的对象而不是直接返回一个新的对象。

/*
在该步骤中，将向你展示两种实现一个创建形状的工厂类的方法。

选项1：创建一个顶层的方法
选项2 ：创建一个工厂模式的构造方法
在这个练习中，你将会使用一个 Shapes 实例来实例化形状的类，并输出打印出他们的面积：
*/

import 'dart:math';

abstract class Shape {
// 创建工厂模式 选项2 ：创建一个工厂模式的构造方法
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }

  num get area;
}

// 包含了两个 getter 方法，分别用来计算圆的面积和四边形的面积
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

main() {
  // 調用類中get方法
  // final circle = Circle(2);
  // final square = Square(2);

  // 調用顶层的方法
  // final circle = shapeFactory('circle');
  // final square = shapeFactory('square');

// 使用抽象类 Shape 中的工厂模式的构造方法
  final circle = Shape('circle');
  final square = Shape('square');

  print(circle.area);
  print(square.area);
}

// 创建工厂模式 选项 1：创建一个顶层的方法
// 在最外层作用域中（在所有类的作用域之外）实现一个工厂方法。
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw 'Can\'t create $type.';
}
