# [为 Java 开发人员准备的 Dart 教程](https://codelabs.flutter-io.cn/codelabs/from-java-to-dart-cn/index.html#0)

此 dart 的教程比对的是 java 的入门教程[The Java™ Tutorials](https://docs.oracle.com/javase/tutorial/java/javaOO/variables.html)

示例代码在`from-java-to-dart-cn_demo`活页夹下

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [Class (类)](#class-%E7%B1%BB)
  - [main 方法](#main-%E6%96%B9%E6%B3%95)
  - [类的构造函数](#%E7%B1%BB%E7%9A%84%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [关键词](#%E5%85%B3%E9%94%AE%E8%AF%8D)
  - [复写 toString()方法](#%E5%A4%8D%E5%86%99-tostring%E6%96%B9%E6%B3%95)
  - [类的变量](#%E7%B1%BB%E7%9A%84%E5%8F%98%E9%87%8F)
- [可选参数](#%E5%8F%AF%E9%80%89%E5%8F%82%E6%95%B0)
- [工厂模式](#%E5%B7%A5%E5%8E%82%E6%A8%A1%E5%BC%8F)
- [接口](#%E6%8E%A5%E5%8F%A3)
- [Dart 中的函数式编程](#dart-%E4%B8%AD%E7%9A%84%E5%87%BD%E6%95%B0%E5%BC%8F%E7%BC%96%E7%A8%8B)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Class (类)

## main 方法

- main() 方法是 Dart 的主方法，如果你需要访问命令行传递过来的参数，可以使用 main(List<String> args 方法。
- main() 方法存在于最外层的作用域，在 Dart 中你可以在类之外编写代码，变量、方法、存取方法都可以独立于类之外维持生命周期。
- 无论是 main() 还是 Bicycle 类都声明为 public 的，默认情况下都是 public 的，在 Dart 中没有诸如 public、private、protected 这样的关键词。
- 在变量名前增加下划线 \_ 来标记为它是私有的
- Dart 使用了 2 个字符长度作为缩进， dartfmt 作为 Dart 的格式化工具可以让你不用去关心 Dart 中的空格问题。

## 类的构造函数

```dart
Bicycle(this.cadence, this.speed, this.gear);
```

这个构造函数没有方法体，这个在 Dart 中是合法的。
如果你在没有方法体的构造函数后忘记书写分号(;) ，DartPad 将会显示一个错误，告诉你"A function body must be provided."
在构造函数的参数中使用 this 可以直接对实例变量进行赋值，不用再编写多余的代码。
上述代码同下列的代码是相同功效的。

```dart
Bicycle(int cadence, int speed, int gear) {
  this.cadence = cadence;
  this.speed = speed;
  this.gear = gear;
}
```

## 关键词

- 在 Dart 2 中，new 关键字变成了可选的。
- 如果你确信某个变量的值不会再发生改变，你可以使用 final 来代替 var

## 复写 toString()方法

- 所有的 Dart 类中都有一个 toString() 方法，你可以复写这个方法来提供更具体的输出信息。

```dart
@override
String toString() => 'Bicycle: $speed mph';
```

- 修饰符 `@override` 会告诉分析器你当前是在复写某个成员方法，如果该复写不成功，分析器就会报错。
- Dart 可以使用单引号或者双引号进行字符串的声明。
- 可以在字符串内使用 `${expression}` 的方式来实现字符串模板的效果，如果该表达式仅仅是一个标识符，还可以去掉花括号 `$variableName`。
- 针对只有一行的方法可以使用 => 来简化方法的书写。

## 类的变量

- 未初始化的变量（即使是数字类型的变量）的值都为 null
- 所有名字以下划线开头的变量，Dart 的编译器都会将其强制标记为私有的
- 默认情况下，Dart 会为所有公开的变量提供存取方法，除非你需要提供仅仅可读、可写，或者在某些情况下需要在 getter 方法中进行计算或是在 setter 方法中进行某些值得更新，否则都不需要再重新定义存取方法。
- 在之前 Java 例子中，cadence 和 gear 都有自己的存取方法，而在此例子中，这些实例变量可以直接通过 `bike.gear` 或者 `bike.cadence` 访问到。
- 你先直接通过 `bike.cadence` 来进行实例变量的访问，然后再去通过定义存取方法来进行重构。提供重构之后的 API 和开始直接访问的版本并不会有很大的差别。

# 可选参数

使用可选参数（而不是使用重载）  
java 代码中 4 个构造函数

```java
public class Rectangle {
    public int width = 0;
    public int height = 0;
    public Point origin;

    // four constructors
    public Rectangle() {
        origin = new Point(0, 0);
    }
    public Rectangle(Point p) {
        origin = p;
    }
    public Rectangle(int w, int h) {
        origin = new Point(0, 0);
        width = w;
        height = h;
    }
    public Rectangle(Point p, int w, int h) {
        origin = p;
        width = w;
        height = h;
    }

    // a method for moving the rectangle
    public void move(int x, int y) {
        origin.x = x;
        origin.y = y;
    }

    // a method for computing the area of the rectangle
    public int getArea() {
        return width * height;
    }
}
```

dart 中只需要一个

```dart
Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});
```

- this.origin, this.width 和 this.height 使用了 Dart 提供的简便方法来直接对类中的实例变量进行赋值。
- this.origin, this.width 和 this.height 嵌套在闭合的花括号中 ({}) ，用来表示它们是可选的命名参数。
- this.origin = const Point(0, 0) 这样的代码表明给实例变量 origin 提供了默认的值 Point(0,0)，默认值必须是在编译期就可以确定的常量。上述代码中的构造方法为三个实例变量都提供了默认参数。
- Rectangle 的构造方法在 Dart 中只需要 1 行代码即可，而在 Java 中则需要 16 行代码。

# 工厂模式

在 Java 中工厂类是一个广泛使用的设计模式，它相比较直接对类进行实例化来说，具有诸多优势，比如隐藏实例化的具体细节，提供可以配置为其它类的能力，直接返回一个已有的对象而不是直接返回一个新的对象。

- Dart 支持抽象类
- 你可以在一个文本中定义多个类
- `dart.math` 是一个 Dart 核心库，其余的还有诸如 `dart:core`，`dart:async`，`dart:convert` 和 `dart:collection` 这样的核心库
- 在 Dart 1.x 的版本中，核心库中的常量是大写的（比如 PI）；在 Dart 2 的版本中，都是小写的(pi)。
- 该代码包含了两个 getter 方法，分别用来计算圆的面积和四边形的面积
  - `num get area => pi * pow(radius, 2); // Circle`
  - `num get area => pow(side, 2); // Square`

示例代码见  
`from-java-to-dart-cn_demo\3create_a_factory.dart`

选项 1 的工厂方法：

- 如果在调用函数时传递的参数不是 'circle'或者 'square'，那么将会抛出一个异常。
- Dart SDK 中已经定义了许多常见的异常，也提供了通过扩展 Exception 类来进行异常的自定义，或者你也可以像上述代码中一样直接抛出字符串用来描述所出现的问题。
- 当出现异常后，DartPad 会直接抛出 Uncaught，你可以将代码封装在 try-catch 语句中来捕获异常。你可以选择通过这个示例代码中来进行相关的练习。
- 如果一个字符串中包含单引号，那么如果该字符串使用单引号声明的则需要在字符串内部的单引号之前增加转义符(`'Can\'t create $type.'`)，如果字符串是使用双引号进行声明的`"Can't create $type."`)，则什么都不需要做。

# 接口

示例代码见  
`from-java-to-dart-cn_demo\4interface.dart`

- Dart 语言并没有提供 interface 关键字，但是**每一个类都隐式地定义了一个接口**。
- 实现类可以没有定义任何行为，在 Dart 中这是完全合法的，不会有任何报错。

# Dart 中的函数式编程

在函数式编程中，你可以做到：

- 将函数当做参数进行传递
- 将函数直接赋值给变量
- 对函数进行解构，只传递给函数一部分参数来调用它，让它返回一个函数去处理剩下的参数（也被称为柯里化）
- 创建一个可以被当作为常量的匿名函数（也被称为 lambda 表达式，在 Java 的 JDK 8 release 中支持了 lambda 表达式）

在 Dart 中，每个函数都是一个对象，并且每个函数都有它的类型 `Function`，这意味着**所有函数都可以支持赋值操作，以及都可以作为参数传递给其它的函数**。

可以将实例化 Dart 类当做一个函数的调用行为。例如：

```dart
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

main() {
  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');
}
```

示例代码见  
`from-java-to-dart-cn_demo\5functional_programming.dart`

更多函数式的迭代特性  
`dart:collection` 库中的 `List` 和 `Iterable` 支持 `fold`, `where`, `join`, `skip` 等函数式方法，另外 Dart 还支持 Map 和 Set 类型。
