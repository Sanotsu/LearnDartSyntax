// 下面的示例中向你展示了一个包含三个属性、两个构造函数以及一个方法的Spacecraft（航天器）类。
// 其中一个属性不能直接赋值，因此它被定义为一个 getter 方法（而不是变量）。

class Spacecraft {
  String name;
  DateTime? launchDate;

  // 只读的不是final的属性（因为只读，所有有个getter方法）
  int? get launchYear => launchDate?.year;

  // 构造函数，使用语法糖来简化该步骤。
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // 命名的构造函数，可以转发到默认的构造函数。
  Spacecraft.unlaunched(String name) : this(name, null);

  // 类中定义的方法
  void describe() {
    print('航天器名称为: $name');
    // Type promotion doesn't work on getters.
    // 类型推广对获取器不起作用。
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('已经发射于: $launchYear ($years years ago)');
    } else {
      print('还未发射');
    }
  }
}

class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
}

// final修饰的实例变量必须初始化
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now(); // 直接初始化

  ProfileMark(this.name);
  ProfileMark.unnamed()
      : name = ''; // 使用构造函数初始化列表 （constructor’s initializer list）初始化
}

// 如果父类没有匿名无参数构造函数，那么子类必须调用父类的其中一个构造函数。
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
  // 因为参数会在子类构造函数被执行前传递给父类的构造函数，因此该参数也可以是一个表达式
  // 类似： Employee() : super.fromJson(fetchDefaultData());
}

void main(List<String> args) {
  // 使用 Spacecraft 类：
  var voyager = Spacecraft('旅行者一号', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('旅行者三号');
  voyager3.describe();

// 使用Point类
  var point = Point();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.

// 查看子类调用父类的命名构造函数
  var employee = Employee.fromJson({});
  print(employee);
}
