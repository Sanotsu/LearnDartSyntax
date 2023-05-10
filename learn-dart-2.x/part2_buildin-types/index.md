<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [内置类型](#%E5%86%85%E7%BD%AE%E7%B1%BB%E5%9E%8B)
  - [Dart 语言支持下列内容](#dart-%E8%AF%AD%E8%A8%80%E6%94%AF%E6%8C%81%E4%B8%8B%E5%88%97%E5%86%85%E5%AE%B9)
  - [Numbers](#numbers)
  - [Strings](#strings)
  - [布尔类型](#%E5%B8%83%E5%B0%94%E7%B1%BB%E5%9E%8B)
  - [Lists](#lists)
  - [Sets](#sets)
  - [Maps](#maps)
  - [Runes 与 grapheme clusters](#runes-%E4%B8%8E-grapheme-clusters)
  - [Symbols](#symbols)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 内置类型

## Dart 语言支持下列内容

- Numbers (int, double)
- Strings (String)
- Booleans (bool)
- Lists (也被称为 arrays)
- Sets (Set)
- Maps (Map)
- Runes (常用于在 Characters API 中进行字符替换)
- Symbols (Symbol)
- null (Null)

其他一些类型在 Dart 语言中也有特殊的作用。

- `Object`：所有 Dart 类的超类，除了 Null。
- `Future` 和 `Stream`：在异步支持中使用。
- `Iterable`：在 for-in 循环和同步生成器函数中使用。
- `Never`：表示一个表达式永远无法成功完成评估。最常用于总是抛出一个异常的函数。
- `dynamic`：表示你想禁用静态检查。通常你应该使用 Object 或 Object?代替。
- `void`：表示一个值永远不会被使用。通常作为返回类型使用。

`Object`、`Object?`、`Null` 和 `Never` 类在类的层次结构中具有特殊的作用，正如在理解 null 安全的上下文中所描述的。

## Numbers

- `int`：整数值；长度不超过 64 位，具体取值范围 依赖于不同的平台。
- `double`：64 位的双精度浮点数字，且符合 IEEE 754 标准。
- int 和 double 都是 `num` 的子类。
  - num 中定义了一些基本的运算符(+ - \* / 等等)
  - 如果 num 及其子类不满足你的要求，可以查看 `dart:math` 库中的 API

## Strings

Dart 字符串（String 对象）包含了 UTF-16 编码的字符序列。

- 可以使用单引号或者双引号来创建字符串。
- 使用三个单引号或者三个双引号也能创建多行字符串
- **在字符串中，请以 `${表达式}` 的形式使用表达式，如果表达式是一个标识符，可以省略掉 `{}`**。
- 如果表达式的结果为一个对象，则 Dart 会调用该对象的 toString 方法来获取一个字符串。
- `==` 运算符负责判断两个对象的内容是否一样，如果两个字符串包含一样的字符编码序列，则表示相等。
- 在字符串前加上 `r` 作为前缀创建 “raw” 字符串（即不会被做任何处理（比如转义）的字符串）
- 字符串字面量是一个编译时常量，只要是编译时常量 (自注：const 的非引用类型？)(null、数字、字符串、布尔) 都可以作为字符串字面量的插值表达式

## 布尔类型

Dart 使用 bool 关键字表示布尔类型，布尔类型只有两个对象 `true` 和 `false`，两者都是编译时常量。

Dart 的类型安全不允许你使用类似` if (nonbooleanValue)` 或者 `assert (nonbooleanValue)` 这样的代码检查布尔值。相反，你应该总是显示地检查布尔值，比如像下面的代码这样：

```dart
// Check for an empty string.
var fullName = '';
assert(fullName.isEmpty);

// Check for zero.
var hitPoints = 0;
assert(hitPoints <= 0);

// Check for null.
var unicorn;
assert(unicorn == null);

// Check for NaN.
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);
```

## Lists

数组 (Array) 是几乎所有编程语言中最常见的集合类型，在 Dart 中数组由 List 对象表示。通常称之为 List。

- List 的下标索引从 0 开始，第一个元素的下标为 0，最后一个元素的下标为 `list.length - 1`。
- 在 List 字面量前添加 const 关键字会创建一个编译时常量
- Dart 在 2.3 引入了 扩展操作符（`...`）和 空感知扩展操作符（`...?`），它们提供了一种将多个元素插入集合的简洁方法。

```dart
var list = [1, 2, 3];
// 这里 Dart 推断出 list 的类型为 List<int>，如果往该数组中添加一个非 int 类型的对象则会报错。
list.add("5"); // The argument type 'String' can't be assigned to the parameter type 'int'

// var list2 = [1, 2, 3, '4']; // List<Object>
var list3 = [0, ...list];
assert(list3.length == 4);  // list3現在为[0,1,2,3]

// 如果扩展操作符右边可能为 null ，你可以使用 null-aware 扩展操作符（...?）来避免产生异常：
var list4;
var list5=[0,...?list4];  // [0]
```

- Dart 还同时引入了**集合中的 if** 和 **集合中的 for** 操作，在**构建集合**时，可以使用条件判断 (if) 和循环 (for)。

```dart
// 集合中的 if 来创建一个 List 的示例，它可能包含 3 个或 4 个元素
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'
];

// 集合中的 for 将列表中的元素修改后添加到另一个列表中的示例
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings); // [#0, #1, #2, #3]

```

_List 类中有许多用于操作 List 的便捷方法，你可以查阅 `泛型Generics` 和 `集合Collections` 获取更多与之相关的信息。_

更多查看[List API](https://api.dart.cn/stable/2.16.2/dart-core/List-class.html)

## Sets

在 Dart 中，set 是一组**特定元素的无序集合**。 Dart 支持的集合由`集合的字面量(set literals)`和 Set 类提供。

_尽管 **Set 类型(type)** 一直都是 Dart 的一项核心功能，但是 **Set 字面量(literals)** 是在 Dart 2.2 中才加入的。_

```dart
// 使用 Set 字面量来创建一个 Set 集合的方法：
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

// 创建空的set
var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set. 因为先有的 Map 字面量语法，所以 {} 默认是 Map 类型。
```

**从 Dart 2.3 开始，Set 可以像 List 一样支持使用扩展操作符（`...` 和 `...?`）以及 集合中 `if` 和 `for` 操作。**

- 使用 `add()` 方法或 `addAll()` 方法向已存在的 Set 中添加项目。
- 使用 `.length` 可以获取 Set 中元素的数量。
- 可以在 Set 变量前添加 const 关键字创建一个 Set 编译时常量。

更多查看[Set API](https://api.dart.cn/stable/2.16.2/dart-core/Set-class.html)

```dart
final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // This line will cause an error.
```

## Maps

- 通常来说，Map 是用来关联 keys 和 values 的对象。其中键和值都可以是任何类型的对象。
- 每个 `key(键)` 只能出现一次但是 `value(值)` 可以重复出现多次。
- Dart 中 Map 提供了 Map 字面量以及 Map 类型两种形式的 Map。

**使用 Map 字面量创建 Map：**

```dart
// Dart 将 gifts 变量的类型推断为 Map<String, String>，而将 nobleGases 的类型推断为 Map<int, String>。
// 如果你向这两个 Map 对象中添加不正确的类型值，将导致运行时异常。
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};
```

**也可以使用 Map 的构造器创建 Map：**

- _也许你想使用 `new Map()` 构造 Map 对象。但是在 Dart 中，`new` 关键词是可选的。(译者注：且不被建议使用)_

```dart
// 在 Dart 中，new 关键词是可选的，且不被建议使用。
var gifts = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

在一个 Map 字面量前添加 const 关键字可以创建一个 Map 编译时常量：

```dart
final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// constantMap[2] = 'Helium'; // This line will cause an error.
```

Map 可以像 List 一样支持使用扩展操作符（`...` 和 `...?`）以及集合的 `if` 和 `for` 操作。

**list、set、map 的许多操作和 js 中的类似**

## Runes 与 grapheme clusters

在 Dart 中，`runes` 公开了字符串的 Unicode 码位。使用 `characters` 包 来访问或者操作用户感知的字符，也被称为 Unicode (扩展) `grapheme clusters`。

```dart
import 'package:characters/characters.dart';
...
var hi = 'Hi 🇩🇰';
print(hi);
print('The end of the string: ${hi.substring(hi.length - 1)}');
print('The last character: ${hi.characters.last}\n');
```

## Symbols

Symbol 表示 Dart 中声明的操作符或者标识符。

- 几乎不会需要 Symbol，但是它们对于那些通过名称引用标识符的 API 很有用，因为代码压缩后，尽管标识符的名称会改变，但是它们的 Symbol 会保持不变。

可以使用在标识符前加 # 前缀来获取 Symbol：

```dart
#radix
#bar
```

Symbol 字面量是编译时常量。

---

_**综合起来看，基本的类型和方法与 js 中的类似。**_
