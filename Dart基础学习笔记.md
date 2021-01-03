# Dart 基础学习笔记

---

## ——2020/01/03

和官网[Dart 开发语言概览](https://dart.cn/guides/language/language-tour)没什么区别，只是希望我过了这么一遍之后，就真能进入到我的脑中了......

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [重要概念](#%E9%87%8D%E8%A6%81%E6%A6%82%E5%BF%B5)
- [关键词](#%E5%85%B3%E9%94%AE%E8%AF%8D)
- [变量](#%E5%8F%98%E9%87%8F)
  - [basic](#basic)
  - [默认值](#%E9%BB%98%E8%AE%A4%E5%80%BC)
  - [Final 和 Const](#final-%E5%92%8C-const)
- [内置类型](#%E5%86%85%E7%BD%AE%E7%B1%BB%E5%9E%8B)
  - [Number](#number)
  - [Strings](#strings)
  - [Booleans](#booleans)
  - [List](#list)
  - [Set](#set)
  - [Maps](#maps)
  - [runes (用于在字符串中表示 Unicode 字符)](#runes-%E7%94%A8%E4%BA%8E%E5%9C%A8%E5%AD%97%E7%AC%A6%E4%B8%B2%E4%B8%AD%E8%A1%A8%E7%A4%BA-unicode-%E5%AD%97%E7%AC%A6)
  - [Symbols](#symbols)
- [函数(Functions)](#%E5%87%BD%E6%95%B0functions)
  - [Parameters](#parameters)
    - [已命名的参数](#%E5%B7%B2%E5%91%BD%E5%90%8D%E7%9A%84%E5%8F%82%E6%95%B0)
    - [可选的位置参数](#%E5%8F%AF%E9%80%89%E7%9A%84%E4%BD%8D%E7%BD%AE%E5%8F%82%E6%95%B0)
    - [默认参数值](#%E9%BB%98%E8%AE%A4%E5%8F%82%E6%95%B0%E5%80%BC)
  - [main() 函数](#main-%E5%87%BD%E6%95%B0)
  - [匿名函数](#%E5%8C%BF%E5%90%8D%E5%87%BD%E6%95%B0)
  - [词法(Lexical)作用域](#%E8%AF%8D%E6%B3%95lexical%E4%BD%9C%E7%94%A8%E5%9F%9F)
  - [词法闭包 (closures)](#%E8%AF%8D%E6%B3%95%E9%97%AD%E5%8C%85-closures)
  - [测试函数是否相等](#%E6%B5%8B%E8%AF%95%E5%87%BD%E6%95%B0%E6%98%AF%E5%90%A6%E7%9B%B8%E7%AD%89)
  - [返回值](#%E8%BF%94%E5%9B%9E%E5%80%BC)
- [运算符](#%E8%BF%90%E7%AE%97%E7%AC%A6)
  - [说明](#%E8%AF%B4%E6%98%8E)
  - [条件表达式](#%E6%9D%A1%E4%BB%B6%E8%A1%A8%E8%BE%BE%E5%BC%8F)
  - [级联运算符（..）](#%E7%BA%A7%E8%81%94%E8%BF%90%E7%AE%97%E7%AC%A6)
- [流程控制语句](#%E6%B5%81%E7%A8%8B%E6%8E%A7%E5%88%B6%E8%AF%AD%E5%8F%A5)
    - [Break 和 Continue](#break-%E5%92%8C-continue)
  - [断言 Assert](#%E6%96%AD%E8%A8%80-assert)
- [异常](#%E5%BC%82%E5%B8%B8)
  - [捕获异常](#%E6%8D%95%E8%8E%B7%E5%BC%82%E5%B8%B8)
- [类 Class](#%E7%B1%BB-class)
  - [使用类的成员](#%E4%BD%BF%E7%94%A8%E7%B1%BB%E7%9A%84%E6%88%90%E5%91%98)
  - [使用构造函数](#%E4%BD%BF%E7%94%A8%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [获取对象的类型](#%E8%8E%B7%E5%8F%96%E5%AF%B9%E8%B1%A1%E7%9A%84%E7%B1%BB%E5%9E%8B)
  - [实例变量](#%E5%AE%9E%E4%BE%8B%E5%8F%98%E9%87%8F)
  - [构造函数](#%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [默认构造函数](#%E9%BB%98%E8%AE%A4%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [构造函数不被继承](#%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0%E4%B8%8D%E8%A2%AB%E7%BB%A7%E6%89%BF)
  - [命名式构造函数](#%E5%91%BD%E5%90%8D%E5%BC%8F%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [调用父类非默认构造函数](#%E8%B0%83%E7%94%A8%E7%88%B6%E7%B1%BB%E9%9D%9E%E9%BB%98%E8%AE%A4%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [初始化列表](#%E5%88%9D%E5%A7%8B%E5%8C%96%E5%88%97%E8%A1%A8)
  - [复位向构造函数](#%E5%A4%8D%E4%BD%8D%E5%90%91%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [常量构造函数](#%E5%B8%B8%E9%87%8F%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [工厂构造函数](#%E5%B7%A5%E5%8E%82%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [方法(Methods)](#%E6%96%B9%E6%B3%95methods)
    - [方法（method）和函数（function）有什么区别？](#%E6%96%B9%E6%B3%95method%E5%92%8C%E5%87%BD%E6%95%B0function%E6%9C%89%E4%BB%80%E4%B9%88%E5%8C%BA%E5%88%AB)
    - [实例方法](#%E5%AE%9E%E4%BE%8B%E6%96%B9%E6%B3%95)
    - [操作符](#%E6%93%8D%E4%BD%9C%E7%AC%A6)
    - [Getter 和 Setter](#getter-%E5%92%8C-setter)
    - [抽象方法(Abstract methods)](#%E6%8A%BD%E8%B1%A1%E6%96%B9%E6%B3%95abstract-methods)
  - [抽象类](#%E6%8A%BD%E8%B1%A1%E7%B1%BB)
  - [隐式接口](#%E9%9A%90%E5%BC%8F%E6%8E%A5%E5%8F%A3)
  - [扩展一个类（Extending a class）](#%E6%89%A9%E5%B1%95%E4%B8%80%E4%B8%AA%E7%B1%BBextending-a-class)
    - [重写类成员](#%E9%87%8D%E5%86%99%E7%B1%BB%E6%88%90%E5%91%98)
    - [noSuchMethod 方法](#nosuchmethod-%E6%96%B9%E6%B3%95)
  - [Extension 方法](#extension-%E6%96%B9%E6%B3%95)
  - [枚举类型](#%E6%9E%9A%E4%B8%BE%E7%B1%BB%E5%9E%8B)
  - [使用 Mixin 为类添加功能](#%E4%BD%BF%E7%94%A8-mixin-%E4%B8%BA%E7%B1%BB%E6%B7%BB%E5%8A%A0%E5%8A%9F%E8%83%BD)
  - [类变量和方法](#%E7%B1%BB%E5%8F%98%E9%87%8F%E5%92%8C%E6%96%B9%E6%B3%95)
    - [静态变量](#%E9%9D%99%E6%80%81%E5%8F%98%E9%87%8F)
    - [静态方法](#%E9%9D%99%E6%80%81%E6%96%B9%E6%B3%95)
- [泛型(Generics)](#%E6%B3%9B%E5%9E%8Bgenerics)
  - [为什么使用泛型？](#%E4%B8%BA%E4%BB%80%E4%B9%88%E4%BD%BF%E7%94%A8%E6%B3%9B%E5%9E%8B)
  - [使用集合字面量](#%E4%BD%BF%E7%94%A8%E9%9B%86%E5%90%88%E5%AD%97%E9%9D%A2%E9%87%8F)
  - [使用类型参数化的构造函数](#%E4%BD%BF%E7%94%A8%E7%B1%BB%E5%9E%8B%E5%8F%82%E6%95%B0%E5%8C%96%E7%9A%84%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
  - [泛型集合以及它们所包含的类型](#%E6%B3%9B%E5%9E%8B%E9%9B%86%E5%90%88%E4%BB%A5%E5%8F%8A%E5%AE%83%E4%BB%AC%E6%89%80%E5%8C%85%E5%90%AB%E7%9A%84%E7%B1%BB%E5%9E%8B)
  - [限制参数化类型](#%E9%99%90%E5%88%B6%E5%8F%82%E6%95%B0%E5%8C%96%E7%B1%BB%E5%9E%8B)
  - [使用泛型方法](#%E4%BD%BF%E7%94%A8%E6%B3%9B%E5%9E%8B%E6%96%B9%E6%B3%95)
- [库和可见性](#%E5%BA%93%E5%92%8C%E5%8F%AF%E8%A7%81%E6%80%A7)
  - [使用库](#%E4%BD%BF%E7%94%A8%E5%BA%93)
    - [指定库前缀](#%E6%8C%87%E5%AE%9A%E5%BA%93%E5%89%8D%E7%BC%80)
    - [导入库的一部分](#%E5%AF%BC%E5%85%A5%E5%BA%93%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86)
    - [延迟加载库](#%E5%BB%B6%E8%BF%9F%E5%8A%A0%E8%BD%BD%E5%BA%93)
- [异步支持](#%E5%BC%82%E6%AD%A5%E6%94%AF%E6%8C%81)
  - [处理 Future](#%E5%A4%84%E7%90%86-future)
  - [声明异步函数](#%E5%A3%B0%E6%98%8E%E5%BC%82%E6%AD%A5%E5%87%BD%E6%95%B0)
  - [处理 Stream](#%E5%A4%84%E7%90%86-stream)
- [生成器](#%E7%94%9F%E6%88%90%E5%99%A8)
- [可调用类](#%E5%8F%AF%E8%B0%83%E7%94%A8%E7%B1%BB)
- [隔离区(Isolates)](#%E9%9A%94%E7%A6%BB%E5%8C%BAisolates)
- [类型定义(Typedefs)](#%E7%B1%BB%E5%9E%8B%E5%AE%9A%E4%B9%89typedefs)
- [元数据](#%E5%85%83%E6%95%B0%E6%8D%AE)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 重要概念

DartDemo

```dart
// Define a function.
void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.  $variableName (或 ${expression})表示字符串插值
}

// This is where the app starts executing.
void main() {       // 一个特殊且 必须的 顶级函数，Dart 应用程序总是会从该函数开始执行。
  var number = 42; // Declare and initialize a variable. 通过这种方式定义变量不需要指定变量类型。
  printInteger(number); // Call a function.
}
```

1. 所有变量引用的都是 _对象_，每个对象都是一个 _类_ 的实例。数字、函数以及 null 都是对象。所有的类都继承于 Object 类。

2. 尽管 **Dart 是强类型语言**，但是在声明变量时指定类型是可选的，因为 Dart 可以进行**类型推断**。在上述代码中，变量 number 的类型被推断为 int 类型。如果想显式地声明一个不确定的类型，可以使用特殊类型 dynamic。

3. Dart 支持泛型，比如` List<int>`（表示一组由 int 对象组成的列表）或 `List<dynamic>`（表示一组由任何类型对象组成的列表）。

4. Dart 支持顶级函数(top-level functions)（例如 main 方法），同时还支持定义属于类或对象的函数（即 _静态_ 和 _实例方法_ static and instance methods）。你还可以在函数中定义函数（_嵌套_ 或 _局部函数_ nested or local functions）。

5. Dart 支持顶级 _变量_，以及定义属于类或对象的变量（静态和实例变量）。实例变量有时称之为域或属性。

6. Dart **没有**类似于 Java 那样的 `public、protected` 和 `private` 成员访问限定符。如果一个标识符以**下划线 (\_) 开头则表示该标识符在库内是私有的**。可以查阅 [库和可见性](https://dart.cn/guides/language/language-tour#libraries-and-visibility) 获取更多相关信息。

7. _标识符_ 可以以字母或者下划线 (\_) 开头，其后可跟字符和数字的组合。

8. Dart 中 _表达式_ 和 _语句_ 是有区别的(expressions (which have runtime values) and statements (which don’t))，**表达式有值而语句没有**。比如条件表达式 `expression condition ? expr1 : expr2` 中含有值 `expr1` 或 `expr2`。与 `if-else` 分支语句相比，`if-else` 分支语句则没有值。**一个语句通常包含一个或多个表达式，但是一个表达式不能只包含一个语句。**

9. Dart 工具可以显示 _警告_ 和 _错误_ 两种类型的问题。警告表明代码可能有问题但不会阻止其运行。错误分为编译时错误和运行时错误；编译时错误代码无法运行；运行时错误会在代码运行时导致异常。

# [关键词](https://dart.cn/guides/language/language-tour#keywords)

应该避免使用这些单词作为标识符。

# 变量

## basic

创建一个变量并将其初始化：

```dart
var name = 'Bob';  // var用于定义变量，通过这种方式定义变量不需要指定变量类型。
String name2 = 'Bob';  // 也可以指定类型
dynamic name3 = 'Bob';  // 一个对象的引用不局限于单一的类型,指定为 Object 或 dynamic 类型。
```

**变量仅存储对象的引用**。这里名为 name 的变量存储了一个 String 类型对象的引用，“Bob” 则是该对象的值。

name 变量的类型被推断为 String，但是你可以为其指定类型。如果一个对象的引用不局限于单一的类型,可以根据[设计指南](https://dart.cn/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed)将其指定为 Object 或 dynamic 类型。

## 默认值

在 Dart 中，未初始化的变量拥有一个默认的初始化值：null。即便数字也是如此，因为在 Dart 中一切皆为对象，数字也不例外。

```dart
int lineCount;
print(lineCount);  // null
```

## Final 和 Const

不想更改一个变量，可以使用关键字 final 或者 const 修饰变量，这两个关键字可以替代 var 关键字或者加在一个具体的类型前。
一个 final 变量只可以被赋值一次；一个 const 变量是一个**编译时常量**（const 变量同时也是 final 的）。
顶层的 final 变量或者类的 final 变量在其第一次使用的时候被初始化。

`实例变量可以是 final 的但不可以是 const 的， final 实例变量必须在构造器开始前被初始化，比如在声明实例变量时初始化，或者作为构造器参数，或者将其置于构造器的 初始化列表中。`

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

**如果使用 const 修饰类中的变量，则必须加上 static 关键字，即 static const**（注意：顺序不能颠倒（译者注））。在声明 const 变量时可以直接为其赋值，也可以使用其它的 const 变量为其赋值：

```dart
const bar = 1000000; // 直接赋值 [Unit of pressure (dynes/cm2)]
const double atm = 1.01325 * bar; // 利用其它 const 变量赋值 (Standard atmosphere)
```

const 关键字不仅仅可以用来定义常量，还可以用来创建 _常量值_，该常量值可以赋予给任何变量。  
你也可以将构造函数声明为 const 的，这种类型的构造函数创建的对象是不可改变的。  
如果使用初始化表达式为常量赋值可以省略掉关键字 const，比如下面的常量 baz 的赋值就省略掉了 const.

```dart
var foo = const [];
final bar = const [];
const baz = []; // 相当于 `const []` (Equivalent to `const []`)
```

没有使用 final 或 const 修饰的变量的值是可以被更改的，即使这些变量之前引用过 const 的值。

```dart
foo = [1, 2, 3]; // foo 的值之前为 const [] (Was const [])
```

常量的值不可以被修改：

```dart
baz = [42]; // 报错：常量不可以被赋值。(Error: Constant variables can't be assigned a value.)
```

从 Dart 2.5 开始，你可以在常量中使用**类型检查**和**强制类型转换** (`is` 和 `as`)、`collection if` 以及 `spread operators` (`...` 和 `...?`)：

```dart
// Valid compile-time constants as of Dart 2.5.
const Object i = 3; // Where i is a const Object with an int value...
const list = [i as int]; // Use a typecast(类型转换).
const map = {if (i is int) i: "int"}; // Use is and collection if.
const set = {if (list is List<int>) ...list}; // ...and a spread.
```

# 内置类型

Dart 语言支持下列的类型：

- numbers
- strings
- booleans
- lists (也被称为 arrays)

- sets
- maps
- runes (用于在字符串中表示 Unicode 字符)

- symbols

## Number

Dart 支持两种 Number 类型：  
int  
整数值；长度不超过 64 位，具体取值范围依赖于不同的平台。在 DartVM 上其取值位于 -2^63 至 2^63 - 1 之间。编译成 JavaScript 的 Dart 使用 JavaScript 数字，其允许的取值范围在 -2^53 至 2^53 - 1 之间。

double  
64 位的双精度浮点数字，且符合 IEEE 754 标准。

int 和 double 都是 num 的子类。 num 中定义了一些基本的运算符比如 +、-、\*、/ 等，还定义了 abs()、ceil() 和 floor() 等方法.
如不满足要求，可以查看 `dart:math` 库中的 API。

```dart
// 定义整数字面量
var x = 1;
var hex = 0xDEADBEEF; // 3735928559
// 浮点数字面量
var y = 1.1;
var exponents = 1.42e5; // 142000.0
// 从 Dart 2.1 开始，整型字面量将会在必要的时候自动转换成浮点数字面量(在 Dart 2.1 之前，在浮点数上下文中使用整数字面量是错误的.).
double z = 1; // Equivalent to double z = 1.0.

// 字符串和数字之间转换的方式

// String -> int
var one = int.parse('1');
assert(one == 1);  // assert 成功就过去了，不成功就抛错 中止了

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');

// 整型支持传统的位移操作，比如移位（<<、>>）、按位与（&）、按位或（  ），例如：
assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 >> 1) == 1); // 0011 >> 1 == 0001
assert((3 | 4) == 7); // 0011 | 0100 == 0111

```

## Strings

Dart 字符串是 UTF-16 编码的字符序列。可以使用单引号或者双引号来创建字符串

```dart
// 创建字符串
var s1 = '使用单引号创建字符串字面量。';
var s2 = "双引号也可以用于创建字符串字面量。";
var s3 = '使用单引号创建字符串时可以使用斜杠来转义那些与单引号冲突的字符串：\'。';
var s4 = "而在双引号中则不需要使用转义与单引号冲突的字符串：'";
```

可以在字符串中以 `${表达式}` 的形式使用表达式，如果表达式是一个标识符，可以省略掉 {}。如果表达式的结果为一个对象，则 Dart 会调用该对象的 `toString` 方法来获取一个字符串。

```dart
// 代码中文解释
var s = '字符串插值';

assert('Dart 有$s，使用起来非常方便。' == 'Dart 有字符串插值，使用起来非常方便。');
assert('使用${s.substring(3,5)}表达式也非常方便' == '使用插值表达式也非常方便。');
```

可以使用 + 运算符将两个字符串连接为一个，也可以将多个字符串挨着放一起变为一个.

```dart
var s1 = '可以拼接'
    '字符串'
    "即便它们不在同一行。";
assert(s1 == '可以拼接字符串即便它们不在同一行。');

var s2 = '使用加号 + 运算符' + '也可以达到相同的效果。';
assert(s2 == '使用加号 + 运算符也可以达到相同的效果。');
```

可以使用三个单引号或者三个双引号创建多行字符串

```dart
var s1 = '''
你可以像这样创建多行字符串。
''';

var s2 = """这也是一个多行字符串。""";
```

在字符串前加上 r 作为前缀创建 “raw” 字符串（即不会被做任何处理（比如转义）的字符串）

```dart
var s = r'In a raw string, not even \n gets special treatment.';

// 代码中文解释
var s = r'在 raw 字符串中，转义字符串 \n 会直接输出 “\n” 而不是转义为换行。';
```

## Booleans

Dart 使用 bool 关键字表示布尔类型，布尔类型只有两个对象 true 和 false，两者都是编译时常量。

Dart 的类型安全不允许你使用类似 if (nonbooleanValue) 或者 assert (nonbooleanValue) 这样的代码检查布尔值。

```dart
// 检查是否为空字符串 (Check for an empty string).
var fullName = '';
assert(fullName.isEmpty);

// 检查是否小于等于零。
var hitPoints = 0;
assert(hitPoints <= 0);

// 检查是否为 null。
var unicorn;
assert(unicorn == null);

// 检查是否为 NaN。
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);
```

## List

Dart 在 2.3 引入了 扩展操作符（...）和 null-aware 扩展操作符（...?），它们提供了一种将多个元素插入集合的简洁方法。

```dart
// 使用扩展操作符（...）将一个 List 中的所有元素插入到另一个 List 中
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);
// 如果**扩展操作符右边可能为 null**，你可以使用 null-aware 扩展操作符（...?）来避免产生异常：
var list;
var list2 = [0, ...?list];
assert(list2.length == 1);
```

Dart 在 2.3 还同时引入了 Collection If 和 Collection For，**在构建集合时，可以使用条件判断（if）和循环（for）。**

```dart
// 下面示例是使用 Collection If 来创建一个 List 的示例，它可能包含 3 个或 4 个元素：
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'
];

// 下面示例是使用 Collection For 将列表中的元素修改后添加到另一个列表中的示例：
var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
assert(listOfStrings[1] == '#1');
```

## Set

可以使用**在 {} 前加上类型参数的方式创建一个空的 Set**，或者将 {} 赋值给一个 Set 类型的变量：

```dart
var names = <String>{}; // 类型+{}的形式创建Set。
// Set<String> names = {}; // 声明类型变量的形式创建 Set (This works, too).
// var names = {}; // 这样的形式将创建一个 Map 而不是 Set (Creates a map, not a set.)
```

**Set 还是 map?**
Map 字面量语法同 Set 字面量语法非常相似。因为先有的 Map 字面量语法，**所以 {} 默认是 Map 类型**。如果忘记在 {} 上注释类型或赋值到一个未声明类型的变量上，那么 Dart 会创建一个类型为 `Map<dynamic, dynamic>` 的对象。

可以在 Set 字面量前添加 const 关键字创建一个 Set 编译时常量

```dart
final constantSet = const {
  'fluorine',
  'chlorine',
};
// constantSet.add('helium'); // This line will cause an error.
```

从 Dart 2.3 开始，Set 可以像 List 一样支持使用扩展操作符（... 和 ...?）以及 Collection If 和 Collection For 操作。

## Maps

通常来说， Map 是用来关联 keys 和 values 的对象。 **keys 和 values 可以是任何类型的对象**。在一个 Map 对象中一个 key 只能出现一次。但是 value 可以出现多次。 Dart 中 Map 通过 Map 字面量和 Map 类型来实现。 Dart 中 Map 提供了 Map 字面量以及 Map 类型两种形式的 Map。

```dart
// 使用 Map 字面量创建 Map
var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};
// 使用 Map 的构造器创建 Map：
var nobleGases = Map();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

这里使用 Map() 而不是使用 new Map() 构造 Map 对象。是因为**从 Dart2 开始，构造对象的 `new` 关键字可以被省略掉。**

Map 的操作与 JavaScript 的操作类似

从 Dart 2.3 Map 可以像 List 一样支持使用扩展操作符（... 和 ...?）以及 Collection If 和 Collection For 操作。

## runes (用于在字符串中表示 Unicode 字符)

在 Dart 中，runes 公开了字符串的 Unicode 码位。从 Dart 2.6 开始，使用 characters 包来访问或者操作用户感知的字符，也被称为 Unicode (扩展) grapheme clusters.。

Unicode 编码为每一个字母、数字和符号都定义了一个唯一的数值。因为 Dart 中的字符串是一个 UTF-16 的字符序列，所以如果想要表示 32 位的 Unicode 数值则需要一种特殊的语法。

通常使用 \uXXXX 来表示 Unicode 字符， XXXX 是一个四位数的 16 进制数字。例如心形字符（♥）的 Unicode 为 `\u2665`。对于不是四位数的 16 进制数字，需要使用大括号将其括起来。例如大笑的 emoji 表情（😆）的 Unicode 为 `\u{1f600}`。

## Symbols

Symbol 表示 Dart 中声明的操作符或者标识符，该类型的对象几乎不会被使用到，但是如果需要按名称引用它们的 API 时就非常有用。因为**代码压缩后会改变这些符号的名称但不会改变具体的符号**。

# 函数(Functions)

Dart 是一种真正面向对象的语言，所以即便函数也是对象并且类型为 Function，这意味着**函数可以被赋值给变量或者作为其它函数的参数**。你也可以像调用函数一样调用 Dart 类的实例。

```dart
// 定义一个函数的例子：

bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
// 虽然高效 Dart 指南建议在公开的 API 上定义返回类型，不过即便不定义，该函数也依然有效：

isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
// 如果函数体内只包含一个表达式，你可以使用简写语法：

bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```

语法` => 表达式` 是 `{ return 表达式; }` 的简写，` =>` 有时也称之为*胖箭头语法*。  
**在 => 与 ; 之间的只能是 表达式 而非 语句。比如你不能将一个 if 语句 放在其中，但是可以放置 条件表达式。**

## Parameters

函数可以有两种形式的参数：**必要参数** 和 **可选参数**。必要参数定义在参数列表前面，可选参数则定义在必要参数后面。可选参数可以是 **命名的** 或 **位置的**。

### 已命名的参数

你调用函数时，可以使用 `参数名: 参数值` 的形式来指定命名参数。

```dart
enableFlags(bold: true, hidden: false);
```

定义函数时，使用 {param1, param2, …} 来指定命名参数：

```dart
/// 设置 [bold] 和 [hidden] 标识……
void enableFlags({bool bold, bool hidden}) {...}
```

虽然命名参数是可选参数的一种类型，但是你仍然可以使用 `@required` 注解来标识一个命名参数是必须的参数，此时调用者则**必须为该参数提供一个值**。

`@required` 注解定义在 `meta package` 中，可以直接导入 `package:meta/meta.dart` 包使用。

```dart
const Scrollbar({Key key, @required Widget child})
```

### 可选的位置参数

使用 [] 将一系列参数包裹起来作为位置参数：

```dart
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
```

### 默认参数值

可以用 `=` 为函数的命名和位置参数定义默认值，默认值必须为编译时常量，没有指定默认值的情况下默认值为 `null`。

```dart
String say2(String from, String msg, [String device = '火箭筒']) {
  var result = '$from says $msg with a $device';
  return result;
}
```

## main() 函数

每个 Dart 程序都必须有一个 `main()` 顶级函数作为程序的入口，`main()` 函数返回值为 `void` 并且有一个 `List<String>` 类型的可选参数。

```dart
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(reverseText);
}
```

**上述代码中的 `..` 语法称之为 `级联调用`。使用级联访问可以在一个对象上执行多个操作。**

## 匿名函数

大多数方法都是有名字的，比如 main() 或 printElement()。
你可以创建一个没有名字的方法，称之为 `匿名函数`，或 `Lambda 表达式` 或 `Closure 闭包`。你可以将匿名方法赋值给一个变量然后使用它，比如将该变量添加到集合或从中删除。

匿名方法看起来与命名方法类似，在括号之间可以定义参数，参数之间用逗号分割。

后面大括号中的内容则为函数体：

```
([[类型] 参数[, …]]) {
  函数体;
};
```

## 词法(Lexical)作用域

Dart 是词法有作用域语言，变量的作用域在写代码的时候就确定了，大括号内定义的变量只能在大括号内访问

## 词法闭包 (closures)

_闭包_ 即一个函数对象，**即使函数对象的调用在它原始作用域之外，依然能够访问在它词法作用域内的变量。**

javascript 中：

> 一个函数和对其周围状态（lexical environment，词法环境）的引用捆绑在一起（或者说函数被引用包围），这样的组合就是闭包（closure）。也就是说，**闭包让你可以在一个内层函数中访问到其外层函数的作用域。**在 JavaScript 中，每当创建一个函数，闭包就会在函数创建的同时被创建出来。

```dart
/// 返回一个将 [addBy] 添加到该函数参数的函数。
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // 生成加 2 的函数。
  var add2 = makeAdder(2); // add2 为一个函数 (int i) => 2 + i;

  // 生成加 4 的函数。
  var add4 = makeAdder(4); // add4 为一个函数 (int i) => 4 + i;

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
```

## 测试函数是否相等

```dart
// 下面是顶级函数，静态方法和示例方法相等性的测试示例：

void foo() {} // 定义顶层函数 (A top-level function)

class A {
  static void bar() {} // 定义静态方法
  void baz() {} // 定义实例方法
}

void main() {
  var x;

  // 比较顶层函数是否相等。
  x = foo;
  assert(foo == x);

  // 比较静态方法是否相等。
  x = A.bar;
  assert(A.bar == x);

  // 比较实例方法是否相等。
  var v = A(); // A 的实例 #1
  var w = A(); // A 的实例 #2

  var y = w;
  x = w.baz;

  // 这两个闭包引用了相同的实例对象，因此它们相等。
  assert(y.baz == x);

  // 这两个闭包引用了不同的实例对象，因此它们不相等。
  assert(v.baz != w.baz);
}
```

## 返回值

**所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 `return null;`。**

# 运算符

运算符的优先级按先后排列，  
即第一行优先级最高，最后一行优先级最低，  
而同一行中，最左边的优先级最高，最右边的优先级最低

| 描述           | 运算符                                    |
| -------------- | ----------------------------------------- |
| 一元后缀       | 表达式++ 表达式-- () [] . ?.              |
| 一元前缀       | -表达式 !表达式 ~表达式 ++表达式 --表达式 |
| 乘除法         | \* / % ~/                                 |
| 加减法         | + -                                       |
| 位运算         | << >> >>>                                 |
| 二进制与       | &                                         |
| 二进制异或     | ^                                         |
| 二进制或       | &#124;                                    |
| 关系和类型测试 | >= > <= < as is is!                       |
| 相等判断       | == !=                                     |
| 逻辑与         | &&                                        |
| 逻辑或         | &#124;&#124;                              |
| 空判断         | ??                                        |
| 条件表达式     | 表达式 1 ? 表达式 2 : 表达式 3            |
| 级联           | ..                                        |
| 赋值           | = \*= /= += -= &= ^= ......etc.           |

## 说明

**要判断两个对象 x 和 y 是否表示相同的事物使用 == 即可。（在极少数情况下，可能需要使用 identical() 函数来确定两个对象是否完全相同。）**。下面是 == 运算符的一些规则：

假设有变量 x 和 y，且 x 和 y 至少有一个为 null，则当且仅当 x 和 y 均为 null 时 x == y 才会返回 true，否则只有一个为 null 则返回 false。

`x.==(y)` 将会返回值，这里不管有没有 y，即 y 是可选的。也就是说 == 其实是 x 中的一个方法，并且可以被重写。详情请查阅重写运算符。

`as、is、is!` 运算符是在运行时判断对象类型的运算符。

**当且仅当** obj 实现了 T 的接口，obj is T 才是 true。例如 `obj is Object` 总为 true，因为所有类都是 Object 的子类。

**仅当**你确定这个对象是该类型的时候，你才可以使用 `as` 操作符可以把对象转换为特定的类型。

可以使用 `=` 来赋值，同时也可以使用 `??=` 来为值为 null 的变量赋值。

```dart
// 当且仅当 b 为 null 时才赋值
b ??= value;
```

`?.` 条件访问成员  
与成员访问符类似，但是左边的操作对象不能为 `null`，例如 `foo?.bar`，如果 `foo` 为 `null` 则返回 `nul`l ，否则返回 `bar`.

## 条件表达式

`条件 ? 表达式 1 : 表达式 2` ：如果条件为 true，执行表达式 1 并返回执行结果，否则执行表达式 2 并返回执行结果。  
`表达式 1 ?? 表达式 2`：如果表达式 1 为非 null 则返回其值，否则执行表达式 2 并返回其值。

如果赋值是根据布尔表达式则考虑使用 `?:`。

```dart
var visibility = isPublic ? 'public' : 'private';
```

如果赋值是根据判定是否为 `null` 则考虑使用 `??`。

```dart
String playerName(String name) => name ?? 'Guest';
```

## 级联运算符（..）

级联运算符（..）可以让你在同一个对象上连续调用多个对象的变量或方法。

```dart
querySelector('#confirm') // 获取对象 (Get an object).
  ..text = 'Confirm' // 使用对象的成员 (Use its members).
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));
```

第一个方法 querySelector 返回了一个 Selector 对象，后面的级联操作符都是**调用这个 Selector 对象的成员并忽略每个操作的返回值**。

上面的代码相当于：

```dart
var button = querySelector('#confirm');
button.text = 'Confirm';
button.classes.add('important');
button.onClick.listen((e) => window.alert('Confirmed!'));
```

**返回值为 void 的方法则不能使用级联运算符。** 在返回对象的函数中谨慎使用级联操作符。

```dart
var sb = StringBuffer();
sb.write('foo')
  ..write('bar'); // 出错：void 对象中没有方法 write (Error: method 'write' isn't defined for 'void').
```

**严格来说 `..` 级联操作并非一个运算符而是 Dart 的特殊语法。**

# 流程控制语句

可以使用下面的语句来控制 Dart 代码的执行流程：

- if 和 else
  - (与 JavaScript 不同的是，Dart 的 if 语句中的条件必须是一个布尔值，不能是其它类型)
- for 循环
  - for、forEach、for-in
- while 和 do-while 循环
- break 和 continue
- switch 和 case
- assert
- 使用 try-catch 和 throw 也能影响控制流，详情参考异常部分。

在 Dart 语言中，for 循环中的闭包会自动捕获循环的 索引值 以避免 JavaScript 中一些常见的陷阱。

```dart
var callbacks = [];
for (var i = 0; i < 2; i++) {
  callbacks.add(() => print(i));
}
callbacks.forEach((c) => c());
```

上述代码执行后会输出 0 和 1，但是如果在 JavaScript 中执行同样的代码则会输出两个 2（当然，如果在 js 中，把 for 循环中 var 改为 let，就一样输出 0 和 1 了）。

如果要遍历的对象实现了 Iterable 接口，则可以使用 forEach() 方法，**如果不需要使用到索引，则使用 forEach 方法是一个非常好的选择**  
(20201218:和 js 不同，一个数组 forEach 回调可以取数组的 value 和 index，dart 的 forEach 就只有 value，所以才说不需要索引 forEach 是个好选择)

### Break 和 Continue

使用 break 可以中断循环：

```dart
while (true) {
  if (shutDownRequested()) break;
  processIncomingRequests();
}
```

使用 continue 可以跳过本次循环直接进入下一次循环：

```dart
for (int i = 0; i < candidates.length; i++) {
  var candidate = candidates[i];
  if (candidate.yearsExperience < 5) {
    continue;
  }
  candidate.interview();
}
```

上述代码中的 candidates 如果像 List 或 Set 一样实现了 Iterable 接口则可以简单地使用下述写法：

```dart
candidates
    .where((c) => c.yearsExperience >= 5)
    .forEach((c) => c.interview());
```

## 断言 Assert

在开发过程中，可以在条件表达式为 `false` 时使用 - assert(条件, 可选信息); - 语句来**打断代码**的执行。
assert 的第二个参数可以为其添加一个字符串消息。

```dart
// 确保变量值小于 100。
assert(number < 100);
assert(urlString.startsWith('https'),
    'URL ($urlString) should start with "https".');
```

# 异常

Dart 代码可以抛出和捕获异常。异常表示一些未知的错误情况，**如果异常没有捕获则会被抛出从而导致抛出异常的代码终止执行**。

与 Java 不同的是，**Dart 的所有异常都是非必检异常**，方法不一定会声明其所抛出的异常并且你也不会被要求捕获任何异常。

Dart 提供了 `Exception` 和 `Error` 两种类型的异常以及它们一系列的子类，你*也可以定义自己的异常类型*。但是在 Dart 中可以将**任何非 null 对象作为异常抛**出而不局限于 Exception 或 Error 类型。

在 Java 的里，`Exception` 与 `Error` 都是继承自 `Throwable`, 只有 `Throwable` 类型的 实例（instance） 才可以被 `throw` 或着 `catch`。

## 捕获异常

- 捕获异常可以避免异常继续传递（重新抛出异常除外）。
- 可以使用 on 或 catch 来捕获异常，使用 on 来指定异常类型，使用 catch 来捕获异常对象，两者可同时使用。
- 可以为 catch 方法指定两个参数，第一个参数为抛出的异常对象，第二个参数为栈信息 StackTrace 对象。
- 关键字 rethrow 可以将捕获的异常再次抛出。
- 可以使用 finally 语句来包裹确保不管有没有异常都执行代码，如果没有指定 catch 语句来捕获异常，则在执行完 finally 语句后再抛出异常。
- finally 语句会在任何匹配的 catch 语句后执行.

```dart
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  // 指定异常
  buyMoreLlamas();
} on Exception catch (e) {
  // 其它类型的异常
  print('Unknown exception: $e');
  rethrow; // 允许调用者查看异常。
}
catch (e, s) {
  // 不指定类型，处理其它全部
  print('Exception details:\n $e');
  print('Stack trace:\n $s');
}finally {
  //// 有匹配catch则先处理异常, 然后清理。
  cleanLlamaStalls();
}
```

# 类 Class

Dart 是**支持基于 mixin 继承机制**的面向对象语言，所有对象都是一个类的实例，而所有的类都继承自 `Object` 类。_基于 mixin 的继承_ 意味着每个除 Object 类之外的类都只有一个超类，一个类的代码可以在其它多个类继承中重复使用。 Extension 方法 是一种在不更改类或创建子类的情况下向类添加功能的方式。

## 使用类的成员

对象的 成员 由函数和数据 functions and data（即 _方法_ 和 _实例变量_ 即 _methods_ and _instance variables_）组成。方法的 调用 要通过对象来完成，这种方式可以访问对象的函数和数据。

使用（`.`）来访问对象的实例变量或方法  
使用 `?.` 代替 . 可以避免因为左边表达式为 null 而导致的问题

```dart
var p = Point(2, 2);
var a = p?.y;
```

## 使用构造函数

可以使用 **构造函数** 来创建一个对象。构造函数的命名方式可以为 `类名` 或 `类名 . 标识符` 的形式。例如下述代码分别使用 Point() 和 Point.fromJson() 两种构造器创建了 Point 对象：

```dart
// Dart2.0之后 new 关键词可省略
var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
```

一些类提供了 _常量构造函数_。使用常量构造函数，在构造函数名之前加 const 关键字，来创建编译时常量时。  
**两个使用相同构造函数相同参数值构造的编译时常量是同一个对象**：

```dart
var a = const ImmutablePoint(1, 1);
var b = const ImmutablePoint(1, 1);

assert(identical(a, b)); // 它们是同一个实例 (They are the same instance!)
```

**根据使用 常量上下文 的场景，你可以省略掉构造函数或字面量前的 const 关键字**。例如下面的例子中我们创建了一个常量 Map：

```dart
// 这里有很多 const 关键字
const pointAndLine = const {
  'point': const [const ImmutablePoint(0, 0)],
  'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};
```

根据上下文，你可以只保留第一个 const 关键字，其余的全部省略(dart2.0 以上)：

```dart
// 只需要一个 const 关键字，其它的则会隐式地根据上下文进行关联。
const pointAndLine = {
  'point': [ImmutablePoint(0, 0)],
  'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
};
```

但是如果无法根据上下文判断是否可以省略 const，则不能省略掉 const 关键字，否则将会创建一个 **非常量对象**。

```dart
var a = const ImmutablePoint(1, 1); // 创建一个常量 (Creates a constant)
var b = ImmutablePoint(1, 1); // 不会创建一个常量 (Does NOT create a constant)

assert(!identical(a, b)); // 这两变量并不相同 (NOT the same instance!)
```

## 获取对象的类型

可以使用 Object 对象的 runtimeType 属性在运行时获取一个对象的类型，该对象类型是 Type 的实例。

```dart
print('The type of a is ${a.runtimeType}');
```

## 实例变量

声明实例变量的示例:

```dart
class Point {
  double x; // 声明 double 变量 x 并初始化为 null。
  double y; // 声明 double 变量 y 并初始化为 null
  double z = 0; // 声明 double 变量 z 并初始化为 0。
}
```

所有未初始化的实例变量其值均为 null。

所有实例变量均会隐式地声明一个 `Getter` 方法，非 `final` 类型的实例变量还会隐式地声明一个 `Setter` 方法。

```dart
class Point {
  double x;
  double y;
}

void main() {
  var point = Point();
  point.x = 4; // 使用 x 的 Setter 方法。
  assert(point.x == 4); // 使用 x 的 Getter 方法。
  assert(point.y == null); // 默认值为 null。
}
```

如果你在声明一个实例变量的时候就将其初始化（而不是在构造函数或其它方法中），那么该实例变量的值就会在对象实例创建的时候被设置，**该过程会在构造函数以及它的初始化器列表执行前**。

## 构造函数

**声明一个与`类名一样的函数`即可声明一个构造函数（对于命名式构造函数 还可以添加额外的标识符）**。大部分的构造函数形式是生成式构造函数，其用于创建一个类的实例：

```dart
class Point {
  double x, y;

  Point(double x, double y) {
    // 还会有更好的方式来实现此逻辑，敬请期待。
    this.x = x;
    this.y = y;
  }
}
```

使用 `this` 关键字引用当前实例。  
当且仅当命名冲突时使用 this 关键字才有意义，否则 Dart 会忽略 this 关键字。

对于大多数编程语言来说在构造函数中为实例变量赋值的过程都是类似的，而 Dart 则提供了一种特殊的语法糖来简化该步骤：

```dart
class Point {
  double x, y;

  // 在构造函数体执行前用于设置 x 和 y 的语法糖。(也就是简写的构造函数，和631-635行对应)
  Point(this.x, this.y);
}
```

## 默认构造函数

如果你没有声明构造函数，那么 Dart 会**自动生成一个无参数的构造函数**并且该构造函数会调用其父类的无参数构造函数。

## 构造函数不被继承

子类不会继承父类的构造函数，如果子类没有声明构造函数，那么只会有一个默认无参数的构造函数。

## 命名式构造函数

可以为一个类声明多个命名式构造函数来表达更明确的意图：

```dart
class Point {
  double x, y;

 // 在构造函数体执行前用于设置 x 和 y 的语法糖。(也就是简写的构造函数)
  Point(this.x, this.y);

  // 命名式构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }
}
```

## 调用父类非默认构造函数

**默认情况下，子类的构造函数会调用父类的匿名无参数构造方法，并且该调用会在子类构造函数的函数体代码执行前**，如果子类构造函数还有一个 _初始化列表_，那么该初始化列表会在调用父类的该构造函数之前被执行.

总的来说，这三者的调用顺序如下：

1. 初始化列表
2. 父类的无参数构造函数
3. 当前类的构造函数

如果父类没有匿名无参数构造函数，那么子类必须调用父类的其中一个构造函数，**为子类的构造函数指定一个父类的构造函数只需在构造函数体前使用（:）指定。**

下面的示例中，Employee 类的构造函数调用了父类 Person 的命名构造函数。

```dart
class Person {
  String firstName;

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
}

main() {
  var emp = new Employee.fromJson({});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
}
```

**传递给父类构造函数的参数不能使用 this 关键字**，因为在参数传递的这一步骤，子类构造函数尚未执行，子类的实例对象也就还未初始化，因此所有的实例成员都不能被访问，但是类成员可以。

## 初始化列表

除了调用父类构造函数之外，还可以在构造函数体执行之前初始化实例变量。每个实例变量之间使用逗号分隔。

```dart
// 使用初始化列表在构造函数体执行前设置实例变量。
Point.fromJson(Map<String, double> json)
    : x = json['x'],
      y = json['y'] {
  print('In Point.fromJson(): ($x, $y)');
}
```

初始化列表表达式 = 右边的语句不能使用 this 关键字。  
初始化列表用来设置 final 字段是非常好用的

```dart
import 'dart:math';

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

main() {
  var p = new Point(2, 3);
  print(p.x); // 2
  print(p.y); // 3
  // p.y=21; // error:'y' can't be used as a setter because it's final
  print(p.distanceFromOrigin); // 3.605551275463989
}
```

## 复位向构造函数

有时候类中的构造函数会调用类中其它的构造函数，该复位向构造函数没有函数体，只需在函数签名后使用（`:`）指定需要复位向到的其它构造函数即可：

```dart
main(List<String> args) {
  var p = Person('ksj');
  print(p.age);
}

class Person {
  String name;
  int age;
// 这是直接进行赋值
// Person(this.name) : age = 10;
// 构造函数复位向 / 内部初始化列表是调用下面的方法 / 也可以赋一个值
  Person(String name) : this._internal(name, 10);
  Person._internal(this.name, this.age);
}
```

## 常量构造函数

如果类生成的对象都是不会变的，那么可以在生成这些对象时就将其变为编译时常量。你可以在类的构造函数前加上 const 关键字并确保所有实例变量均为 final 来实现该功能。

```dart
class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
```

常量构造函数创建的实例并不总是常量

## 工厂构造函数

使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数，这将意味着**使用该构造函数构造类的实例时`并非总是`会返回新的实例对象。**例如，工厂构造函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。

在如下的示例中， Logger 的工厂构造函数从缓存中返回对象，和 Logger.fromJson 工厂构造函数从 JSON 对象中初始化一个最终变量。

```dart
class Logger {
  final String name;
  bool mute = false;

  // _cache 变量是库私有的，因为在其名字前面有下划线。
  static final Map<String, Logger> _cache =
      <String, Logger>{};

//  Logger 的工厂构造函数从缓存中返回对象
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

 // Logger.fromJson 工厂构造函数从 JSON 对象中初始化一个最终变量。
  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
```

**在工厂构造函数中无法访问 this。**

工厂构造函的调用方式与其它构造函数一样：

```dart
var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);
```

## 方法(Methods)

方法是对象提供行为的函数(Methods are functions that provide behavior for an object.)。

### 方法（method）和函数（function）有什么区别？

**函数**是**独立**的功能，与对象无关，需要**显示的传递数据**.

**方法与对象和类相关**，依赖对象而调用，可以直接处理对象上的数据，也就是**隐式传递数据**.

### 实例方法

对象的实例方法可以访问实例变量和 this。

### 操作符

运算符是有着特殊名称的实例方法。 Dart 允许您使用以下名称定义运算符：
| | | | |
| --- | --- |---|---|
|< |+| \|| []|
|> |/| ^ |[]=|
|<= |~/| &| ~|
|>= |\* |<<| ==|
|– |% |>>| |

**你可能注意到有一些 操作符 没有出现在列表中，例如 !=。因为它们仅仅是语法糖。表达式 e1 != e2 仅仅是 !(e1 == e2) 的一个语法糖。**

为了表示重写操作符，我们使用 `operator` 标识来进行标记。下面是重写 + 和 - 操作符的例子：

```dart
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown.
  // •••
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}
```

### Getter 和 Setter

Getter 和 Setter 是一对用来读写对象属性的特殊方法，上面说过实例对象的每一个属性都有一个隐式的 Getter 方法，如果为非 final 属性的话还会有一个 Setter 方法，你可以使用 get 和 set 关键字为额外的属性添加 Getter 和 Setter 方法：

```dart
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // 定义两个计算产生的属性：right 和 bottom。
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

使用 Getter 和 Setter 的好处是，你可以先使用你的实例变量，过一段时间过再将它们包裹成方法且不需要改动任何代码，**即先定义后更改且不影响原有逻辑**。

**像自增（++）这样的操作符不管是否定义了 Getter 方法都会正确地执行。为了避免一些不必要的异常情况，运算符只会调用 Getter 一次，然后将其值存储在一个临时变量中**

### 抽象方法(Abstract methods)

实例方法、Getter 方法以及 Setter 方法都可以是抽象的，_定义一个接口方法而不去做具体的实现让实现它的类去实现该方法_，`抽象方法只能存在于抽象类中`。

直接使用分号（;）替代方法体即可声明一个抽象方法：

```dart
abstract class Doer {
  // 定义实例变量和方法等等……
  void doSomething(); // 定义一个抽象方法。
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // 提供一个实现，所以在这里该方法不再是抽象的……
  }
}
```

抽象方法的意义在于，**规定了他的所有子类`必须拥有`一个这样子的方法，或者提供一个这样子的服务**，但是实现这个方法的方式，会因为子类的不同的结构而有所不同。

## 抽象类

使用关键字 abstract 标识类可以让该类成为 抽象类，**抽象类将无法被实例化**。**抽象类常用于声明接口方法、有时也会有具体的方法实现。如果想让抽象类同时可被实例化，可以为其定义`工厂构造函数`。**

## 隐式接口

每一个类都隐式地定义了一个接口并实现了该接口，这个接口包含`所有`这个类的实例成员以及这个类所实现的其它接口。如果想要创建一个 A 类支持调用 B 类的 API 且不想继承 B 类，则可以实现 B 类的接口。

一个类可以通过关键字 implements 来实现一个或多个接口并实现每个接口定义的 API：

```dart
// Person 类的隐式接口中包含 greet() 方法。
class Person {
  // _name 变量同样包含在接口中，但它只是库内可见的。
  final _name;

  // 构造函数不在接口中。
  Person(this._name);

  // greet() 方法在接口中。
  String greet(String who) => '你好，$who。我是$_name。';
}

// Person 接口的一个实现。
class Impostor implements Person {
  get _name => '';

  String greet(String who) => '你好$who。你知道我是谁吗？';
}

String greetBob(Person person) => person.greet('小芳');

void main() {
  print(greetBob(Person('小芸')));
  print(greetBob(Impostor()));
}
```

可以实现多个类接口，使用逗号分割每个接口类。

## 扩展一个类（Extending a class）

使用 extends 关键字来创建一个子类，并可使用 super 关键字引用一个父类：

```dart
class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
  // •••
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  // •••
}
```

### 重写类成员

子类可以重写父类的实例方法（包括 操作符）、 Getter 以及 Setter 方法。你可以使用`@override` 注解来表示你重写了一个成员：

```dart
class SmartTelevision extends Television {
  @override
  void turnOn() {...}
  // •••
}
```

**如果重写 == 操作符，必须也同时重写对象 hashCode 的 Getter 方法。[参看](https://dart.cn/guides/libraries/library-tour#implementing-map-keys)**

### noSuchMethod 方法

如果调用了对象上不存在的方法或实例变量将会触发 `noSuchMethod` 方法，你可以重写 noSuchMethod 方法来追踪和记录这一行为：

```dart
class A {
  // 除非你重写 noSuchMethod，否则调用一个不存在的成员会导致 NoSuchMethodError。
  @override
  void noSuchMethod(Invocation invocation) {
  print('你尝试使用一个不存在的成员：' + '${invocation.memberName}');
  }
}
```

你不能调用一个未实现的方法 **`除非`下面其中的一个条件成立**：

- 接收方是静态的 `dynamic` 类型。
- 接收方具有静态类型，定义了未实现的方法（抽象亦可），并且接收方的动态类型实现了 `noSuchMethod` 方法且具体的实现与 `Object` 中的不同。

## Extension 方法

Dart 2.7 中引入的 Extension 方法是向现有库添加功能的一种方式。你可能甚至都不知道有 Extension 方法。

## 枚举类型

枚举类型是一种特殊的类型，也称为 **enumerations** 或 **enums**，用于定义一些固定数量的常量值。

每一个枚举值都有一个名为 `index` 成员变量的 `Getter` 方法，该方法将会返回以 `0` 为基准索引的位置值。

可以使用枚举类的 `values` 方法获取一个包含所有枚举值的列表.

```dart
enum Color { red, green, blue }
assert(Color.green.index == 1);

List<Color> colors = Color.values;
assert(colors[2] == Color.blue);
```

枚举类型有如下两个限制：

- 枚举不能成为子类，也不可以 mix in，你也不可以实现一个枚举。
- 不能显式地实例化一个枚举类。

## 使用 Mixin 为类添加功能

**Mixin 是一种在多重继承中复用某个类中代码的方法模式。**

使用 `with` 关键字并在其后跟上 Mixin 类的名字来使用 Mixin 模式：

```dart
class Musician extends Performer with Musical {
  // •••
}

class Maestro extends Person
    with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
```

**定义一个类继承自 Object 并且不为该类定义构造函数，这个类就是 Mixin 类**，除非你想让该类与普通的类一样可以被正常地使用，否则可以使用关键字 `mixin` 替代 class 让其成为一个单纯的 Mixin 类：

`mixin` 关键字在 Dart 2.1 中才被引用支持。早期版本中的代码通常使用 `abstract class` 代替。

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

可以使用关键字 on 来指定哪些类可以使用该 Mixin 类，比如有 Mixin 类 A，但是 A 只能被 B 类使用，则可以这样定义 A.

```dart
class Musician {
  // ...
}
// mixin 类 MusicalPerformer只能被类 Musician使用

mixin MusicalPerformer on Musician {
  // ...
}
// 只有扩展或实现Musician类的类才能使用mixin MusicalPerformer。
// only classes that extend or implement the Musician class can use the mixin MusicalPerformer.
// Because SingerDancer extends Musician, SingerDancer can mix in MusicalPerformer.
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
```

## 类变量和方法

使用关键字 static 可以声明类变量或类方法。

### 静态变量

静态变量（即类变量）常用于声明类范围内所属的状态变量和常量：

**使用 `驼峰式大小写` 来命名常量。**

```dart
class Queue {
  static const initialCapacity = 16;
  // •••
}

void main() {
  assert(Queue.initialCapacity == 16);
}
```

**静态变量在其首次被使用的时候才被初始化。**

### 静态方法

静态方法（即类方法）不能被一个类的实例访问，同样地，静态方法内也不可以使用 this：

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
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
```

**对于一些通用或常用的静态方法，应该将其定义为顶级函数而非静态方法。**

可以将静态方法作为编译时常量。例如，你可以将静态方法作为一个参数传递给一个常量构造函数。

# 泛型(Generics)

如果你查看数组的 API 文档，你会发现数组 List 的实际类型为 `List<E>`。 `<…>` 符号表示数组是一个 泛型（或 参数化类型） 通常 使用一个字母来代表类型参数，比如 E、T、S、K 和 V 等等。

## 为什么使用泛型？

泛型常用于需要要求类型安全的情况，但是它也会对代码运行有好处：

- 适当地指定泛型可以更好地帮助代码生成。
- 使用泛型可以减少代码重复。

泛型可以让你在多个不同类型实现之间共享同一个接口声明

```dart
// 比如下面的例子中声明了一个类用于缓存对象的接口：
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

// 不久后你可能又会想专门为 String 类对象做一个缓存，于是又有了专门为 String 做缓存的类：
abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

// 如果过段时间你又想为数字类型也创建一个类，那么就会有很多诸如此类的代码……

// 这时候可以考虑使用泛型来声明一个类，让不同类型的缓存实现该类做出不同的具体实现即可：
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
```

在上述代码中，T 是一个替代类型。其相当于类型占位符，在开发者调用该接口的时候会指定具体类型。

## 使用集合字面量

List、Set 以及 Map 字面量也可以是参数化的。定义参数化的 List 只需在中括号前添加 `<type>`；定义参数化的 Map 只需要在大括号前添加 `<keyType, valueType>`：

```dart
var names = <String>['小芸', '小芳', '小民'];
var uniqueNames = <String>{'小芸', '小芳', '小民'};
var pages = <String, String>{
  'index.html': '主页',
  'robots.txt': '网页机器人提示',
  'humans.txt': '我们是人类，不是机器'
};
```

## 使用类型参数化的构造函数

在 _调用构造方法时也可以使用泛型，只需在类名后用尖括号（<...>）将一个或多个类型包裹即可_：

```dart
var nameSet = Set<String>.from(names);
```

下面代码创建了一个键为 Int 类型，值为 View 类型的 Map 对象：

```dart
var views = Map<int, View>();
```

## 泛型集合以及它们所包含的类型

Dart 的泛型类型是 _固化（reified）_ 的，这意味着即便在运行时也会保持类型信息：

```dart
var names = List<String>();
names.addAll(['小芸', '小芳', '小民']);
print(names is List<String>); // true
```

**与 Java 不同的是，Java 中的泛型是类型 _擦除（erasure）_ 的，这意味着泛型类型会在运行时被移除。在 Java 中你可以判断对象是否为 List 但不可以判断对象是否为 `List<String>`。**

## 限制参数化类型

有时使用泛型的时候可能会想**限制泛型的类型范围**，这时候可以使用 `extends` 关键字：

```dart
class Foo<T extends SomeBaseClass> {
  // 具体实现……
  String toString() => "'Foo<$T>' 的实例";
}

class Extender extends SomeBaseClass {...}
```

这时候就可以使用 _SomeBaseClass 或者它的子类来作为泛型参数_：

```dart
var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();
```

这时候也可以 _指定无参数的泛型_，这时无参数泛型的类型则为 `Foo<SomeBaseClass>`：

```dart
var foo = Foo();
print(foo); // 'Foo<SomeBaseClass>' 的实例 (Instance of 'Foo<SomeBaseClass>')
```

将非 SomeBaseClass 的类型作为泛型参数则会导致编译错误：

```dart
var foo = Foo<Object>();
```

## 使用泛型方法

起初 Dart 只支持在类的声明时指定泛型，现在同样也可以在方法上使用泛型，称之为 泛型方法：

```dart
T first<T>(List<T> ts) {
  // 处理一些初始化工作或错误检测……
  T tmp = ts[0];
  // 处理一些额外的检查……
  return tmp;
}
```

方法 `first<T>` 的泛型 T 可以在如下地方使用：

- 函数的返回值类型 (T)。
- 参数的类型 (`List<T>`)。
- 局部变量的类型 (T tmp)。

# 库和可见性

`import` 和 `library` 关键字可以帮助你创建一个模块化和可共享的代码库。代码库不仅只是提供 API 而且还起到了封装的作用：以下划线（\_）开头的成员仅在代码库中可见。_每个 Dart 程序都是一个库，即便没有使用关键字 library 指定。_

Dart 的库可以使用包工具来发布和部署。

## 使用库

使用 import 来指定命名空间以便其它库可以访问。

比如你可以导入代码库 dart:html 来使用 Dart Web 中相关 API：

```dart
import 'dart:html';
```

**import 的唯一参数是用于指定代码库的 URI**，对于 Dart _内置的库，使用 dart:xxxxxx 的形式_。而对于其它的库，你可以使用一个文件系统路径或者以 `package:xxxxxx` 的形式。`package:xxxxxx` 指定的库通过包管理器（比如 pub 工具）来提供：

_URI 代表统一资源标识符。URL（统一资源定位符）是一种常见的 URI。_

```dart
import 'package:test/test.dart';
```

### 指定库前缀

如果你导入的两个代码库有冲突的标识符，你可以为其中一个指定前缀。比如如果 library1 和 library2 都有 Element 类，那么可以这么处理：

```dart
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// 使用 lib1 的 Element 类。
Element element1 = Element();

// 使用 lib2 的 Element 类。
lib2.Element element2 = lib2.Element();
```

### 导入库的一部分

如果你只想使用代码库中的一部分，你可以有选择地导入代码库。例如：

```dart
// 只导入 lib1 中的 foo。(Import only foo).
import 'package:lib1/lib1.dart' show foo;

// 导入 lib2 中除了 foo 外的所有。
import 'package:lib2/lib2.dart' hide foo;
```

### 延迟加载库

延迟加载（也常称为 懒加载）允许应用在需要时再去加载代码库，下面是可能使用到延迟加载的场景：

- 为了减少应用的初始化时间。
- 处理 A/B 测试，比如测试各种算法的不同实现。
- 加载很少会使用到的功能，比如可选的屏幕和对话框。

**目前只有 dart2js 支持延迟加载 。Flutter、Dart VM 以及 DartDevc 目前都不支持延迟加载**。

使用 deferred as 关键字来标识需要延时加载的代码库：

**代码库只会被加载一次.**

```dart
import 'package:greetings/hello.dart' deferred as hello;
// 当实际需要使用到库中 API 时先调用 loadLibrary 函数加载库：

Future greet() async {
  // 使用 await 关键字暂停代码执行直到库加载完成。
  // loadLibrary 函数可以调用多次也没关系，代码库只会被加载一次。
  await hello.loadLibrary();
  hello.printGreeting();
}
```

当你使用延迟加载的时候需要牢记以下几点：

- 延迟加载的代码库中的常量需要在代码库被加载的时候才会导入，未加载时是不会导入的。
- 导入文件的时候无法使用延迟加载库中的类型。如果你需要使用类型，则考虑吧接口类型转移到另一个库中然后让两个库都分别导入这个接口库。
- Dart 会隐式地将 loadLibrary 方法导入到使用了 `deferred as` _命名空间_ 的类中。loadLibrary 函数返回的是一个 Future。

# 异步支持

Dart 代码库中有大量返回 `Future` 或 `Stream` 对象的函数，这些函数都是 _异步_ 的，它们会**在耗时操作（比如 I/O）执行完毕前直接返回而不会等待耗时操作执行完毕。**

`async` 和 `await` 关键字用于实现异步编程，并且让你的代码看起来就像是同步的一样。

## 处理 Future

可以通过下面两种方式，获得 Future 执行完成的结果：

- 使用 async 和 await；
- 使用 Future API

尽管异步函数可以处理耗时操作，但是它并不会等待这些耗时操作完成，异步函数执行时会在其遇到第一个 await 表达式（详情见）的时候返回一个 Future 对象，然后等待 await 表达式执行完毕后继续执行。

await 表达式的返回值通常是一个 Future 对象；如果不是的话也会自动将其包裹在一个 Future 对象里。Future 对象代表一个“承诺”，await 表达式会阻塞直到需要的对象返回。

**如果在使用 await 时导致编译错误，请确保 await 在一个异步函数中使用。**

## 声明异步函数

定义 异步函数 只需在普通方法上加上 async 关键字即可。

将关键字 async 添加到函数并让其返回一个 Future 对象。假设有如下返回 String 对象的方法：

```dart
String lookUpVersion() => '1.0.0';
```

将其改为异步函数，返回值是 Future：

```dart
Future<String> lookUpVersion() async => '1.0.0';
```

注意，函数体不需要使用 Future API。如有必要，Dart 会创建 Future 对象。

**如果函数没有返回有效值，需要设置其返回类型为 `Future<void>`。**

## 处理 Stream

如果想从 Stream 中获取值，可以有两种选择：

- 使用 async 关键字和一个 异步循环（使用 `await for` 关键字标识）。
- 使用 Stream API。

_在使用 await for 关键字前，确保其可以令代码逻辑更加清晰并且是真的需要等待所有的结果执行完毕。例如，通常不应该在 UI 事件监听器上使用 await for 关键字，因为 UI 框架发出的事件流是无穷尽的。_

使用 await for 定义异步循环看起来是这样的：

```dart
await for (varOrType identifier in expression) {
  // 每当 Stream 发出一个值时会执行
}
```

_表达式_ 的类型必须是 `Stream`。执行流程如下：

- 等待直到 Stream 返回一个数据。
- 使用 1 中 Stream 返回的数据执行循环体。
- 重复 1、2 过程直到 Stream 数据返回完毕。

**使用 break 和 return 语句可以停止接收 Stream 数据，这样就跳出了循环并取消注册监听 Stream。**

如果在实现异步 for 循环时遇到编译时错误，请检查确保 await for 处于异步函数中。

```dart
Future main() async {
  // ...
  await for (var request in requestServer) {
    handleRequest(request);
  }
  // ...
}
```

# 生成器

当你需要延迟地生成一连串的值时，可以考虑使用 生成器函数。Dart 内置支持两种形式的生成器方法：

- **同步(Synchronous )** 生成器：返回一个 Iterable 对象。
- **异步(Asynchronous )** 生成器：返回一个 Stream 对象。

通过在函数上加 `sync*` 关键字并将返回值类型设置为 `Iterable` 来实现一个 _同步_ 生成器函数，在函数中使用 `yield` 语句来传递值：

```dart
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}
```

实现 _异步_ 生成器函数与同步类似，只不过关键字为 `async*` 并且返回值为 `Stream`：

```dart
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}
```

如果生成器是`递归调用`的，可是使用 `yield*` 语句提升执行性能：

```dart
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
```

# 可调用类

**通过实现类的 `call()` 方法，允许使用类似函数调用的方式来使用该类的实例。**

在下面的示例中，WannabeFunction 类定义了一个 call() 函数，函数接受三个字符串参数，函数体将三个字符串拼接，字符串间用空格分割，并在结尾附加了一个感叹号。单击运行按钮执行代码。

```dart
class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang');

main() => print(out); // Hi there, gang!
```

# 隔离区(Isolates)

大多数计算机中，甚至在移动平台上，都在使用多核 CPU。为了有效利用多核性能，开发者一般使用共享内存的方式让线程并发地运行。然而，多线程共享数据通常会导致很多潜在的问题，并导致代码运行出错。

为了解决多线程带来的并发问题，Dart 使用 `isolates` 替代线程，所有的 Dart 代码均运行在一个 `isolates` 中。每一个 `isolates` 有它自己的堆内存以确保其状态不被其它 `isolates` 访问。

# 类型定义(Typedefs)

在 Dart 语言中，函数与 String 和 Number 一样都是对象，可以**使用 _类型定义_（或者叫 _方法类型别名_）来为函数的类型命名**。使用函数命名将该函数类型的函数赋值给一个变量时，类型定义将会保留相关的类型信息。

比如下面的代码**没有使用类型定义**：

```dart
class SortedCollection {
  Function compare;

  SortedCollection(int f(Object a, Object b)) {
    // 将参数 f 赋值给 compare 时，函数的类型信息丢失了，这里 f 这个函数的类型为 `(Object, Object) → int`（→ 代表返回）
    // 当然该类型也是一个 Function 的子类，但是将 f 赋值给 compare 后，f 的类型 `(Object, Object) → int` 就会丢失。
    compare = f;
  }
}

// 简单的不完整实现。
int sort(Object a, Object b) => 0;

void main() {
  SortedCollection coll = SortedCollection(sort);
  // 我们知道 compare 是一个函数类型的变量，但是具体是什么样的函数却不得而知。
  assert(coll.compare is Function);
}
```

我们可以使用 `typedef` **显式地保留类型信息**：

```dart
typedef Compare = int Function(Object a, Object b);

class SortedCollection {
  Compare compare;

  SortedCollection(this.compare);
}

// 简单的不完整实现。
int sort(Object a, Object b) => 0;

void main() {
  SortedCollection coll = SortedCollection(sort);
  assert(coll.compare is Function);
  assert(coll.compare is Compare);
}
```

_目前类型定义只能用在函数类型上，但是将来可能会有变化。_

因为**类型定义只是别名**，因此我们可以使用它判断任意函数类型的方法：

```dart
typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}
```

# 元数据

使用元数据可以为代码增加一些额外的信息。元数据注解以 @ 开头，其后紧跟一个编译时常量（比如 deprecated）或者调用一个常量构造函数。

Dart 中有两个注解是所有代码都可以使用的：`@deprecated` 和 `@override`

可以自定义元数据注解。下面的示例定义了一个带有两个参数的 @todo 注解：

```dart
library todo;

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
```

使用 @todo 注解的示例：

```dart
import 'todo.dart';

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}
```
