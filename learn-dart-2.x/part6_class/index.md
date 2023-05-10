<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [使用类](#%E4%BD%BF%E7%94%A8%E7%B1%BB)
  - [使用类的成员](#%E4%BD%BF%E7%94%A8%E7%B1%BB%E7%9A%84%E6%88%90%E5%91%98)
  - [使用构造函数](#%E4%BD%BF%E7%94%A8%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [获取对象的类型](#%E8%8E%B7%E5%8F%96%E5%AF%B9%E8%B1%A1%E7%9A%84%E7%B1%BB%E5%9E%8B)
- [实现一个类(类包含的东西)](#%E5%AE%9E%E7%8E%B0%E4%B8%80%E4%B8%AA%E7%B1%BB%E7%B1%BB%E5%8C%85%E5%90%AB%E7%9A%84%E4%B8%9C%E8%A5%BF)
  - [实例变量(Instance variables)](#%E5%AE%9E%E4%BE%8B%E5%8F%98%E9%87%8Finstance-variables)
  - [构造函数(constructors)](#%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0constructors)
    - [默认构造函数](#%E9%BB%98%E8%AE%A4%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
    - [构造函数不被继承](#%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0%E4%B8%8D%E8%A2%AB%E7%BB%A7%E6%89%BF)
    - [命名式构造函数](#%E5%91%BD%E5%90%8D%E5%BC%8F%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
    - [调用父类非默认构造函数](#%E8%B0%83%E7%94%A8%E7%88%B6%E7%B1%BB%E9%9D%9E%E9%BB%98%E8%AE%A4%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
    - [初始化列表](#%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8)
    - [重定向构造函数](#%E9%87%8D%E5%AE%9A%E5%90%91%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
    - [常量构造函数](#%E5%B8%B8%E9%87%8F%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
    - [工厂构造函数](#%E5%B7%A5%E5%8E%82%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [方法(Methods)](#%E6%96%B9%E6%B3%95methods)
    - [实例方法](#%E5%AE%9E%E4%BE%8B%E6%96%B9%E6%B3%95)
    - [操作符](#%E6%93%8D%E4%BD%9C%E7%AC%A6)
    - [Getter 和 Setter](#getter-%E5%92%8C-setter)
    - [抽象方法](#%E6%8A%BD%E8%B1%A1%E6%96%B9%E6%B3%95)
  - [抽象类(Abstract classes)](#%E6%8A%BD%E8%B1%A1%E7%B1%BBabstract-classes)
  - [隐式接口（Implicit interfaces）](#%E9%9A%90%E5%BC%8F%E6%8E%A5%E5%8F%A3implicit-interfaces)
  - [扩展（extends、继承）一个类](#%E6%89%A9%E5%B1%95extends%E7%BB%A7%E6%89%BF%E4%B8%80%E4%B8%AA%E7%B1%BB)
    - [重写(override)类成员](#%E9%87%8D%E5%86%99override%E7%B1%BB%E6%88%90%E5%91%98)
    - [noSuchMethod 方法](#nosuchmethod-%E6%96%B9%E6%B3%95)
  - [扩展方法(Extension methods)](#%E6%89%A9%E5%B1%95%E6%96%B9%E6%B3%95extension-methods)
  - [枚举类型](#%E6%9E%9A%E4%B8%BE%E7%B1%BB%E5%9E%8B)
    - [使用枚举](#%E4%BD%BF%E7%94%A8%E6%9E%9A%E4%B8%BE)
  - [使用 Mixin 为类添加功能](#%E4%BD%BF%E7%94%A8-mixin-%E4%B8%BA%E7%B1%BB%E6%B7%BB%E5%8A%A0%E5%8A%9F%E8%83%BD)
  - [类变量和方法(Class variables and methods)](#%E7%B1%BB%E5%8F%98%E9%87%8F%E5%92%8C%E6%96%B9%E6%B3%95class-variables-and-methods)
    - [静态变量](#%E9%9D%99%E6%80%81%E5%8F%98%E9%87%8F)
    - [静态方法](#%E9%9D%99%E6%80%81%E6%96%B9%E6%B3%95)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 使用类

import 和 library 关键字可以帮助你创建一个模块化和可共享的代码库。  
代码库不仅只是提供 API 而且还起到了封装的作用：**以下划线（\_）开头的成员仅在代码库中可见**。  
**每个 Dart 程序都是一个库(Every Dart app is a library)，即便没有使用关键字 library 指定。**

---

- Dart 是支持基于 mixin 继承机制的面向对象语言。
- 所有对象都是一个类的实例，而除了 Null 以外的所有的类都继承自 Object 类。
- `基于 mixin 的继承` 意味着尽管每个类（顶层类 `Object?` 除外）都只有一个超类。
- 一个类的代码可以在其它多个类继承中重复使用。

- 扩展方法(Extension methods) 是一种在不更改类或创建子类的情况下向类添加功能的方式。

## 使用类的成员

- 对象的 成员 由函数和数据（即 `方法(methods)` 和 `实例变量(instance variables)`）组成。
- 方法的 调用 要通过对象来完成，这种方式可以访问对象的函数和数据。
- 使用（`.`）来访问对象的实例变量或方法。
- 使用 `?.` 代替 `.` 可以避免因为左边表达式为 null 而导致的问题

```dart
var p = Point(2, 2);

// Get the value of y.
assert(p.y == 2);

// Invoke distanceTo() on p [调用实例p上的distanceTo()方法].
double distance = p.distanceTo(Point(4, 4));
// If p is non-null, set a variable equal to its y value.
var a = p?.y;
```

## 使用构造函数

可以使用 **构造函数** 来创建一个对象。构造函数的命名方式可以为 _`类名`_ 或 _`类名.标识符`_ 的形式。例如下述代码分别使用 `Point()` 和 `Point.fromJson()` 两种构造器创建了 Point 对象：

```dart
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
```

以下代码具有相同的效果，但是*构造函数名前面的的 new 关键字是可选的*(最好不用)：

```dart
var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
```

一些类提供了【**常量构造函数**】(如果类生成的对象都是不变的，可以在生成这些对象时就将其变为编译时常量。)。使用常量构造函数，在构造函数名之前加 const 关键字，来创建编译时常量时：

```dart
var p = const ImmutablePoint(2, 2);
```

两个使用相同构造函数相同参数值构造的编译时常量是同一个对象：

```dart
var a = const ImmutablePoint(1, 1);
var b = const ImmutablePoint(1, 1);

assert(identical(a, b)); // They are the same instance!
```

**在 _常量上下文_ 场景中，你可以省略掉构造函数或字面量前的 const 关键字。**

例如下面的例子中我们创建了一个常量 Map：

```dart
// Lots of const keywords here.
const pointAndLine = const {
  'point': const [const ImmutablePoint(0, 0)],
  'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};
// 根据上下文，你可以只保留第一个 const 关键字，其余的全部省略：

// Only one const, which establishes the constant context.
const pointAndLine = {
  'point': [ImmutablePoint(0, 0)],
  'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
};
```

**但是如果无法根据上下文判断是否可以省略 const，则不能省略掉 const 关键字，否则将会创建一个 非常量对象**。

例如：

```dart
var a = const ImmutablePoint(1, 1); // Creates a constant
var b = ImmutablePoint(1, 1); // Does NOT create a constant

assert(!identical(a, b)); // NOT the same instance!
```

## 获取对象的类型

可以使用 `Object 对象的 runtimeType 属性`在运行时获取一个对象的类型，该对象类型是 Type 的实例。

```dart
print('The type of a is ${a.runtimeType}');
```

在生产环境使用**类型判断运算符**：

- `as`[类型转换（也用作指定 类前缀)）]、
- `is`[如果对象是指定类型则返回 true]、
- `is!`[如果对象是指定类型则返回 false]。

运算符是在运行时判断对象类型的运算符。

# 实现一个类(类包含的东西)

## 实例变量(Instance variables)

下面是声明实例变量的示例：

```dart
class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
  double z = 0; // Declare z, initially 0.
}
```

**所有未初始化的实例变量其值均为 null。**  
**所有实例变量均会隐式地声明一个 Getter 方法。**
**非终值(non-final)的实例变量和 late final 声明但未声明初始化的实例变量还会隐式地声明一个 Setter 方法。**

```dart
void main() {
  var point = Point();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.
}
```

如果实例变量是 `final` 的，那就必须初始化。  
在声明时，使用构造函数参数或使用构造函数的初始化器列表初始化 `final`、`non-late` 实例变量。

```dart
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();    // 直接初始化

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';    // 使用构造函数初始化列表 （constructor’s initializer list）初始化
}
```

## 构造函数(constructors)

- 声明一个与类名一样的函数即可声明一个构造函数
- （对于命名式构造函数 还可以添加额外的标识符）。
- 大部分的构造函数形式是生成式构造函数，**其用于创建一个类的实例**。

```dart
class Point {
  double x = 0;
  double y = 0;

/*
// 使用 this 关键字引用当前实例
  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
  */
// 语法糖方式
   Point(this.x, this.y);
}
```

### 默认构造函数

如果你没有声明构造函数，那么 Dart 会自动生成一个无参数的构造函数并且该构造函数会调用其父类的无参数构造方法。

### 构造函数不被继承

子类不会继承父类的构造函数，如果子类没有声明构造函数，那么只会有一个默认无参数的构造函数。

### 命名式构造函数

可以为一个类声明多个命名式构造函数来表达更明确的意图。

```dart
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}
```

构造函数是不能被继承的，这将意味着子类不能继承父类的命名式构造函数，  
如果你想在子类中提供一个与父类命名构造函数名字一样的命名构造函数，则需要在子类中显式地声明。

### 调用父类非默认构造函数

**默认情况下，子类的构造函数会调用父类的匿名无参数构造方法**，并且该调用会在子类构造函数的函数体代码执行前，  
如果子类构造函数还有一个 初始化列表，那么该初始化列表会在调用父类的该构造函数之前被执行，  
总的来说，这三者的调用顺序如下：

- 初始化列表
- 父类的无参数构造函数
- 当前类的构造函数

**如果父类没有匿名无参数构造函数，那么子类必须调用父类的其中一个构造函数。**

- _为子类的构造函数指定一个父类的构造函数只需在构造函数体前使用（:）指定。_

```dart
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  // 为子类的构造函数指定一个父类的构造函数，在子类构造函数加个 【： 父类构造函数】 即可
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

void main() {
  var employee = Employee.fromJson({});
  print(employee);
  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'
}
```

**请注意:**

传递给父类构造函数的参数不能使用 this 关键字。

- 因为在参数传递的这一步骤，子类构造函数尚未执行，子类的实例对象也就还未初始化，因此所有的实例成员都不能被访问，但是类成员可以。

### 初始化列表

除了调用父类构造函数之外，还可以在构造函数体执行之前初始化实例变量。每个实例变量之间使用逗号分隔。

```dart
// Initializer list sets instance variables before
// the constructor body runs.
Point.fromJson(Map<String, double> json)
    : x = json['x']!,
      y = json['y']! {
  print('In Point.fromJson(): ($x, $y)');
}
```

**请注意:**

初始化列表表达式 = 右边的语句不能使用 this 关键字。

```dart
// 使用初始化列表设置 final 字段非常方便，下面的示例中就使用初始化列表来设置了三个 final 变量的值。
import 'dart:math';

class Point {
  final double x;
  final double y;
  final double distanceFromOrigin;

  Point(double x, double y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

void main() {
  var p = Point(2, 3);
  print(p.distanceFromOrigin);  // 3.605551275463989
}
```

### 重定向构造函数

有时候**类中的构造函数仅用于调用类中其它的构造函数**，  
此时该构造函数没有函数体，只需**在函数签名后使用（:）指定需要重定向到的其它构造函数 (使用 this 而非类名)**：

```dart
class Point {
  double x, y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Delegates to the main constructor.
  // 委托给主构造函数。
  Point.alongXAxis(double x) : this(x, 0);
}
```

### 常量构造函数

如果类生成的对象都是不变的，可以在生成这些对象时就将其变为编译时常量。  
可以在类的构造函数前加上 const 关键字并确保所有实例变量均为 final 来实现该功能。

```dart
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
```

### 工厂构造函数

使用 `factory` 关键字标识类的构造函数将会令该构造函数变为工厂构造函数，这将意味着使用该构造函数构造类的实例时并非总是会返回新的实例对象。

**在工厂构造函数中无法访问 this。**

例如，工厂构造函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。

```dart
class Logger {
  final String name;
  bool mute = false;

  // _cache 是私有变量，因为前缀 _ 的缘故。
  static final Map<String, Logger> _cache = <String, Logger>{};

 // Logger 的工厂构造函数从缓存中返回对象，和 Logger.fromJson 工厂构造函数从 JSON 对象中初始化一个最终变量。
  factory Logger(String name) {
    return _cache.putIfAbsent(
        name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
```

## 方法(Methods)

方法是为对象提供行为的函数(Methods are functions that provide behavior for an object.)。

### 实例方法

对象的实例方法可以访问实例变量和 this。

```dart
import 'dart:math';

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  // distanceTo() 方法就是一个实例方法
  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}
```

### 操作符

运算符是有着特殊名称的实例方法。

Dart 允许使用以下名称定义运算符:
| | |||
| :----: | :----: |:----: |:----: |
|< |+| \| |>>>|
|> |/| ^ |[]|
|<= |~/| & |[]=|
|>= |\*| <<| ~|
|– |%| >>| ==|

**为了表示重写操作符，使用 `operator` 标识来进行标记。**

```dart
class Vector {
  final int x, y;

  Vector(this.x, this.y);

// 把+ - 重寫为向量的+ -
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown.
  // ···
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}
```

### Getter 和 Setter

- `Getter` 和 `Setter` 是一对用来读写对象属性的特殊方法，
- 实例对象的每一个属性都有一个隐式的 `Getter` 方法，如果为非 `final` 属性的话还会有一个 Setter 方法，
- 可以使用 `get` 和 `set` 关键字为额外的属性添加 `Getter` 和 `Setter` 方法。
  - 使用 `Getter` 和 `Setter` 的好处是，你可以先使用你的实例变量，过一段时间过再将它们包裹成方法且不需要改动任何代码，即先定义后更改且不影响原有逻辑。
  - 像自增（`++`）这样的操作符不管是否定义了 `Getter` 方法都会正确地执行。
  - 为了避免一些不必要的异常情况，运算符只会调用 `Getter` 一次，然后将其值存储在一个临时变量中。

```dart
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}
```

### 抽象方法

抽象方法就是以 abstract 修饰的方法，这种方法只声明返回的数据类型、方法名称和所需的参数，没有方法体，也就是说**抽象方法只需要声明而不需要实现**。

**当一个方法为抽象方法时，意味着这个方法必须被子类的方法所重写，否则其子类的该方法仍然是 abstract 的**，而这个子类也必须是抽象的，即声明为 abstract。

- 实例方法、Getter 方法以及 Setter 方法都可以是抽象的，
- 定义一个接口方法而不去做具体的实现让实现它的类去实现该方法，
- **抽象方法只能存在于*抽象类*中**,
- 直接使用分号（`;`）替代方法体即可声明一个抽象方法

```dart
abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}
```

## 抽象类(Abstract classes)

- 使用关键字 `abstract` 标识类可以让该类成为 抽象类，
- 抽象类将无法被实例化。
- 抽象类常用于声明接口方法、有时也会有具体的方法实现。
- 如果想让抽象类同时可被实例化，可以为其定义 工厂构造函数。
- 抽象类常常会包含抽象方法。

```dart
// 该类被声明为抽象类，因此无法实例化。
abstract class AbstractContainer {
  // Define constructors, fields, methods...

  void updateChildren(); // 抽象方法。
}
```

## 隐式接口（Implicit interfaces）

- **每一个类都隐式地定义了一个接口并实现了该接口，这个接口包含所有这个类的实例成员以及这个类所实现的其它接口。**
  - 也就是说，当我们定义了一个类的时候，同时就会产生一个和此类同名的接口，而且此接口包含了我们定义的类中所有的方法，以及它的成员变量。
- 如果想要创建一个 A 类支持调用 B 类的 API 且不想继承 B 类，则可以实现 B 类的接口。
- 一个类可以通过关键字 `implements` 来**实现一个或多个接口并实现每个接口定义的 API**。
  - 如果需要**实现多个类接口**，可以使用逗号分割每个接口类。

```dart
/**
 * 隐式接口
 *
 * 库和可见性(Libraries and visibility)说明：
 * import 和 library 关键字可以帮助你创建一个模块化和可共享的代码库。
 * 代码库不仅只是提供 API 而且还起到了封装的作用：以下划线（_）开头的成员仅在代码库中可见。
 * 每个 Dart 程序都是一个库，即便没有使用关键字 library 指定。
 */

// Person类，隐式接口 greet().
class Person {
  // 库中可见的私有变量 _name
  final String _name;

  // 构造函数
  Person(this._name);

  // 库中的方法
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.Person接口的实现。
class Impostor implements Person {
  String get _name => '';
  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
  var p = Person('张三'); // 张三
  print(p._name);
  print(p.greet("李四")); // Hello, 李四. I am 张三.

  print(greetBob(Person('Kathy'))); // Hello, Bob. I am Kathy.
  print(greetBob(Impostor())); // Hi Bob. Do you know who I am?
}
```

## 扩展（extends、继承）一个类

**Dart 支持单继承。**

使用 extends 关键字来创建一个子类，并可使用 super 关键字引用一个父类

```dart
class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
  // ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  // ···
}
```

### 重写(override)类成员

- 子类可以重写父类的实例方法（包括 操作符）、 Getter 以及 Setter 方法。
  - 可以使用 `@override` 注解来表示你重写了一个成员.
- 一个重写方法的声明必须在几个方面与它所重新的方法（或方法）相匹配:
  - **返回类型**必须与被重写方法的返回类型相同（或为其子类型）。
  - **参数类型**必须与被重写方法的参数类型相同（或者是超类型）。
  - 如果被重写的方法接受 **n 个位置参数**，那么被重写的方法也必须接受 n 个位置参数。
  - 一个泛型方法不能重写一个非泛型方法，而一个非泛型方法也不能重写一个泛型方法。
- **注意：如果重写 `==` 操作符，必须同时重写对象 hashCode 的 Getter 方法。**
- 可以使用 `covariant` 关键字 来缩小代码中那些符合 `类型安全` 的方法参数或实例变量的类型。

```dart
class Television {
  // ···
  set contrast(int value) {...}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {...}
  // ···
}
```

### noSuchMethod 方法

如果调用了对象上不存在的方法或实例变量将会触发 `noSuchMethod` 方法。

可以重写 `noSuchMethod` 方法来追踪和记录这一行为。

```dart
class A {
  // 除非重写noSuchMethod，否则使用不存在的成员会导致NoSuchMethodError。
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}
```

**只有下面其中一个条件成立时，你才能调用一个未实现的(unimplemented)方法：**

- 接收方(receiver)是静态的 `dynamic` 类型。
- 接收方(receiver)具有静态类型，定义了未实现的方法（抽象亦可），并且接收方的动态类型实现了 `noSuchMethod` 方法且具体的实现与 `Object` 中的不同。

## 扩展方法(Extension methods)

**扩展方法是向现有库添加功能的一种方式。** 可能已经在不知道它是扩展方法的情况下使用了它。

[Extension methods](https://dart.dev/guides/language/extension-methods)

## 枚举类型

枚举类型是一种特殊的类型，也称为 `enumerations` 或 `enums`，用于定义一些固定数量的常量值。

### 使用枚举

- 使用关键字 `enum` 来定义枚举类型
  - 可以在声明枚举类型时使用 尾随逗号(最后一个值后面加了逗号)
- 每一个枚举值都有一个名为 `index` 成员变量的 `Getter` 方法，该方法将会返回以 `0` 为基准索引的位置值。
- 想要获得全部的枚举值，使用枚举类的 `values` 方法获取包含它们的列表。
- 可以在 `Switch` 语句中使用枚举
  - 但是需要注意的是必须处理枚举值的每一种情况，即每一个枚举值都必须成为一个 case 子句，不然会出现警告。

```dart
enum Color { red, green, blue }

var aColor = Color.blue;

switch (aColor) {
  case Color.red:
    print('Red as roses!');
    break;
  case Color.green:
    print('Green as grass!');
    break;
  default: // Without this, you see a WARNING.
    print(aColor); // 'Color.blue'
}
```

**枚举类型有如下两个限制**：

- 枚举不能成为子类，也不可以 `mix in`，你也不可以实现一个枚举。
- 不能显式地实例化一个枚举类。

## 使用 Mixin 为类添加功能

Mixin 是一种在多重继承中复用某个类中代码的方法模式。  
（dart 是单继承多实现，使用 mixin 可以多重继承）

使用 `with` 关键字并在其后跟上 Mixin 类的名字来使用 Mixin 模式

```dart
class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
```

想要实现一个 Mixin，请创建**一个继承自 `Object` 且未声明构造函数的类**。

- 除非想让该类与普通的类一样可以被正常地使用，否则请使用关键字 `mixin` 替代 `class`。

```dart
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
```

可以使用关键字 `on` 来指定哪些类可以使用该 `Mixin` 类。

```dart
// 只有扩展或实现Musician类的类才能使用MusicalPerformer这个混合器(mixin)。
// 因为SingerDancer扩展(extends)了Musician，所以SingerDancer可以混入MusicalPerformer。
class Musician {
  // ...
}
mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
```

## 类变量和方法(Class variables and methods)

使用关键字 `static` 可以声明类变量或类方法(静态变量或静态方法)。

### 静态变量

静态变量（即类变量）常用于声明类范围内所属的状态变量和常量。  
**静态变量在其首次被使用的时候才被初始化**。

```dart
class Queue {
  static const initialCapacity = 16;
  // ···
}

void main() {
  assert(Queue.initialCapacity == 16);
}
```

### 静态方法

静态方法（即类方法）不能对实例进行操作，因此不能使用 `this`。但是他们可以访问静态变量。

可以将静态方法作为编译时常量。例如，你可以将静态方法作为一个参数传递给一个常量构造函数。

```dart
import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
    // 可以在一个类上直接调用静态方法
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
```
