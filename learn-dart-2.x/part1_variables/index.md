<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [1 变量基础](#1-%E5%8F%98%E9%87%8F%E5%9F%BA%E7%A1%80)
  - [默认值](#%E9%BB%98%E8%AE%A4%E5%80%BC)
  - [late 变量](#late-%E5%8F%98%E9%87%8F)
  - [Final 和 Const](#final-%E5%92%8C-const)
- [notes](#notes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 1 变量基础

- 虽然 Dart 是代码类型安全的语言，但是由于其支持类型推断，因此大多数变量不需要显式地指定类型。
- 变量仅存储对象的引用。
- 通过 var 声明局部变量而非使用指定的类型。

```dart
/*
  - 这里名为 name 的变量存储了一个 String 类型对象的引用，“Bob” 则是该对象的值。
  - name 变量的类型被推断为 String，但是你可以为其指定类型。
  - 如果一个对象的引用不局限于单一的类型，可以将其指定为 Object（或 dynamic）类型。
  */
var name = 'Bob';
Object name = 'Bob';
String name = 'Bob';

var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};
```

### 默认值

- 在 Dart 中，未初始化以及可空类型的变量拥有一个默认的初始值 null。（如果你未迁移至 空安全，所有变量都为可空类型。）即便数字也是如此，因为在 Dart 中一切皆为对象，数字也不例外。
- 如果启用 null 安全性，则必须在使用不可为 null 的变量之前初始化它们的值。
- assert() 的调用将会在生产环境的代码中被忽略掉。在开发过程中，assert(condition) 将会在 条件判断 为 false 时抛出一个异常。

```dart
int? lineCount;
assert(lineCount == null);
int lineCount = 0 ;
```

### late 变量

作用：

- 声明一个不可为空的变量，并在声明后被初始化。
- 懒惰(lazy)地初始化一个变量。

```dart
late String description;
```

### Final 和 Const

- 如果你不想更改一个变量，可以使用关键字 final 或者 const 修饰变量，
  - 这两个关键字可以替代 var 关键字或者加在一个具体的类型前。
- 一个 final 变量只可以被赋值一次；一个 const 变量是一个编译时常量（const 变量同时也是 final 的）。
- 顶层的 final 变量或者类的 final 变量在其第一次使用的时候被初始化。
- note： 实例变量 可以是 final 的但不可以是 const。
- 不能修改一个 final 变量的值。
- 使用关键字 const 修饰变量表示该变量为 编译时常量。
  - 如果使用 const 修饰类中的变量，则必须加上 static 关键字，即 static const（译者注：顺序不能颠倒）
- const 关键字不仅仅可以用来定义常量，还可以用来创建 常量值，该常量值可以赋予给任何变量。
- 常量的值不可以被修改。

```dart
final bname = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';

// 如果使用初始化表达式为常量赋值可以省略掉关键字 const
const baz = []; // Equivalent to `const baz = const []`

// 没有使用 final 或 const 修饰的变量的值是可以被更改的，即使这些变量之前引用过 const 的值。
var foo = const [];

// 你可以在常量中使用 类型检查和强制类型转换 (is 和 as)、 集合中的 if 以及 展开操作符 (... 和 ...?)：
const Object i = 3; // Where i is a const Object with an int value...
const list = [i as int]; // Use a typecast.
const map = {if (i is int) i: 'int'}; // Use is and collection if.
const set = {if (list is List<int>) ...list}; // ...and a spread.

void main() {
  print('Hello, World!');
  print('变量： image is ${image}');
  print('变量： lineCount is ${lineCount}'); // 变量： lineCount is null

  description = '先声明了这个变量，但在使用的时候才给的值。';
  print(description);

  foo = [1, 2, 3]; // 之前是 const []，但因为不是使用final或者const声明，只是值为const，所以可以修改值
  print(foo); // [1, 2, 3]

  print(i); // 3
  print(list); // [3]
  print(map); // {3:int}
  print(set); // {3}
}
```

## notes

- 1 变量仅存储对象的引用。变量可以自动推断，一般不需要指定类型。如果变量不局限与一种类型，可声明为 Object 或者 dynamic 类型。
- 2 **dart 中一切皆为对象。未初始化以及可空类型的变量拥有一个默认的初始值 null**。
- 3 如果有先声明变量，lazy 地初始化，或者初始化变量成本较高地时候，可以使用 late 修饰变量。
- 4 final 修饰的变量不可修改， const 修饰的是一个编译时常量。const 变量同时也是 final。
- 4.1 可以在常量中使用类型检查（is）和类型转换（as），在常量集合（Set）中使用集合中的 if 以及 展开操作符。
