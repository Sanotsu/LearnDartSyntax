// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  String get _name => '666';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

// 使用关键字 enum 来定义枚举类型
enum Color { red, green, blue }
void main() {
  print(greetBob);
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));

// 每一个枚举值都有一个名为 index 成员变量的 Getter 方法
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
  List<Color> colors = Color.values;
  print(colors); // [Color.red, Color.green, Color.blue]
}
