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
