<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [函数](#%E5%87%BD%E6%95%B0)
  - [参数](#%E5%8F%82%E6%95%B0)
  - [main() 函数](#main-%E5%87%BD%E6%95%B0)
  - [函数是一级对象](#%E5%87%BD%E6%95%B0%E6%98%AF%E4%B8%80%E7%BA%A7%E5%AF%B9%E8%B1%A1)
  - [匿名函数](#%E5%8C%BF%E5%90%8D%E5%87%BD%E6%95%B0)
  - [词法作用域](#%E8%AF%8D%E6%B3%95%E4%BD%9C%E7%94%A8%E5%9F%9F)
  - [词法闭包](#%E8%AF%8D%E6%B3%95%E9%97%AD%E5%8C%85)
  - [测试函数是否相等](#%E6%B5%8B%E8%AF%95%E5%87%BD%E6%95%B0%E6%98%AF%E5%90%A6%E7%9B%B8%E7%AD%89)
  - [返回值](#%E8%BF%94%E5%9B%9E%E5%80%BC)
- [notes](#notes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 函数

- Dart 是一种真正面向对象的语言，所以即便函数也是对象并且类型为 Function。
  - 这意味着函数可以被赋值给变量或者作为其它函数的参数。
  - 你也可以像调用函数一样调用 Dart 类的实例。
- `=>` (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用。
  - 语法 `=> 表达式` 是 `{ return 表达式; }` 的简写， `=>` 有时也称之为 **箭头函数**。

```dart
// 建议 为每个函数的参数以及返回值都指定类型
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}


// 在 => 与 ; 之间的只能是 表达式 而非 语句。
bool isEven(int number) => number % 2 == 0;

```

### 参数

- 必要参数 和 可选参数
  - **必要参数定义在参数列表前面，可选参数则定义在必要参数后面**。
  - 可选参数可以是 `命名的` 或 `位置的`。
- （简单理解：不是可选的位置参数就是必要参数）

- 命名参数

  - 定义函数时，使用 `{参数 1, 参数 2, …}` 来指定命名参数。
  - **命名参数默认为可选参数，除非他们被特别标记为 required**。

- 可选的位置参数

  - **使用 `[]` 将一系列参数包裹起来作为位置参数**。
  - 不用[]或者{}那就是必填的位置参数了。

- 默认参数值

  - 可以用 `=` 为函数的命名参数和位置参数定义默认值。
  - 默认值必须为编译时常量，没有指定默认值的情况下默认值为 null。
  - `List` 或 `Map` 同样也可以作为默认值。

- 可选位置参数和可选命名参数不能混合在一起使用，因为可选参数列表只能位于整个函数形参列表的最后。

```dart
void main(List<String> args) {
  print(say('111', '222', 'phone'));
  // 111 says 222 with a phone action is Smile
}

String say(String from, String msg, [String? device, String? action = "Smile"]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device action is $action';
  }
  return result;
}

```

### main() 函数

每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口， main() 函数返回值为 void 并且有一个 `List<String>` 类型的可选参数。

```dart
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
/*
将此部分代码保存为test.dart之后，在该文件的终端命令运行，例如
`dart .\test.dart 1 test`
则会输出参数数组：[1, test]
*/
```

### 函数是一级对象

- 可以将函数作为参数传递给另一个函数。
- 也可以将函数赋值给一个变量。

```dart
// 最常用的函数作为参数：forEach的参数
void printElement(int element) {
 print(element);
}
```

### 匿名函数

- 大多数函数都是有名字的，比如 `main()` 或 `printElement()`。
- 可以创建一个没有名字的函数，称之为 `匿名函数`、 `Lambda 表达式` 或 `Closure 闭包`。
  - 可以将匿名函数赋值给一个变量然后使用它，比如将该变量添加到集合或从中删除。
- 匿名函数看起来与命名函数类似，在括号之间可以定义参数，参数之间用逗号分割。
  - **如果函数体内只有一行返回语句，你可以使用胖箭头缩写法。**

后面大括号中的内容则为函数体：

```
([[类型] 参数[, …]]) {
  函数体;
};
```

```dart
// 定义了只有一个参数 item 且没有参数类型的匿名方法。
// List 中的每个元素都会调用这个函数，打印元素位置和值的字符串
const list = ['apples', 'bananas', 'oranges'];

list.forEach((item) {
  print('${list.indexOf(item)}: $item');
});
```

### 词法作用域

- Dart 是词法有作用域语言，变量的作用域在写代码的时候就确定了，大括号内定义的变量只能在大括号内访问，与 Java 类似。

```dart
bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      print(topLevel);
      print(insideMain);
      print(insideFunction);
      print(insideNestedFunction);
    }

    nestedFunction(); // 打印4个 true
  }

  myFunction();
}
//  nestedFunction() 函数可以访问包括顶层变量在内的所有的变量。
```

### 词法闭包

- 闭包 即一个函数对象，即使函数对象的调用在它原始作用域之外，依然能够访问在它词法作用域内的变量。
- 函数可以封闭定义到它作用域内的变量。

```dart
// 函数 makeAdder() 捕获了变量 addBy。
// 无论函数在什么时候返回，它都可以使用捕获的 addBy 变量。
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print(add2(3) == 5);
  print(add4(3) == 7);
}
```

### 测试函数是否相等

下面是顶级函数(top-level functions)，静态方法(static methods)和实例方法(instance methods)相等性的测试示例。

```dart
void foo() {} // 一个顶级函数

class A {
  static void bar() {} // 一个静态方法
  void baz() {} // 一个实例方法
}

void main() {
  Function x;

  // 比较顶级方法。
  x = foo;
  print('1: ${foo == x}'); // 1: true

  // 比较静态方法。
  x = A.bar;
  print(A.bar == x); // true

  // 比较实例方法。
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // 这些闭包引用同一个实例（#2），因此它们是相等的。
  print(y.baz == x);

  // 这些闭包引用不同的实例，因此它们是不相等的。
  print(v.baz != w.baz);
}
```

### 返回值

- 所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 `return null;`。

## notes

- 1 和 js 的函数基本类似，注意函数的命名参数和可选位置参数不能同时用。
- 2 每个函数都有返回值，如果是 `void`，则是省略了 `return null;`。
- 3 也是有闭包，注意闭包的两个主要目的即可：
  - 一个是可以在全局作用域中读取内部函数的的变量，
  - 另一个就是可以让闭包中引用的变量始终保存在内存中。
- 4 每个 Dart 程序都必须有一个` main()` 顶级函数作为程序的入口。
