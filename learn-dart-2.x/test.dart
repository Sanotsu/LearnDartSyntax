/**创建一个 Impostor 类支持调用 Person 类的 API 且不想继承 Person 类，则可以实现 Person 类的接口。 */

// Person类，包含隐式接口 greet().
class Person {
  // 隐式接口包含实例成员：类的私有变量 _name
  final String _name;

  // 隐式接口不包含类构造函数
  Person(this._name);

  // 隐式接口包含实例成员：类中的方法
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// Person接口(包含了Person类中定义的所有的方法，以及它的成员变量)的实现。
class Impostor implements Person {
  String get _name => '';
  String greet(String who) => 'Hi $who. Do you know who I am?';
}

// 定义一个接受Person类作为参数的函数，调用了类中的greet()方法
String greetBob(Person person) => person.greet('Bob');

void main() {
  var p = Person('张三'); // 张三
  print(p._name);
  print(p.greet("李四")); // Hello, 李四. I am 张三.

  // 正常调用Person实例
  print(greetBob(Person('Kathy'))); // Hello, Bob. I am Kathy.
  // 调用继承Person类的隐式接口的Impostor类的实例
  print(greetBob(Impostor())); // Hi Bob. Do you know who I am?
}
