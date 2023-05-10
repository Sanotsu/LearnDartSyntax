<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [基础控制流程语句](#%E5%9F%BA%E7%A1%80%E6%8E%A7%E5%88%B6%E6%B5%81%E7%A8%8B%E8%AF%AD%E5%8F%A5)
- [note](#note)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 基础控制流程语句

- if else
  - 不同于 JavaScript，Dart 的 if 语句中的条件必须是布尔值而不能为其它类型。
- for、
  - for 循环中的闭包会自动捕获循环的 索引值 以避免 JavaScript 中一些常见的陷阱。
- for in
  - 如果要遍历的对象是一个可迭代对象（例如 List 或 Set），并且你不需要知道当前的遍历索引，则可以使用 for-in 方法进行 遍历。
- forEach
  - 可迭代对象同时可以使用 forEach() 方法作为另一种选择。
- while
  - while 循环会在执行循环体前先判断条件。
  - do-while 循环则会 先执行一遍循环体 再判断条件。
- Break 和 Continue
  - 使用 break 可以中断循环。
  - 使用 continue 可以跳过本次循环直接进入下一次循环。
- Switch 和 Case
  - Dart 中的 Switch 语句仅适用于有限的情况，比如使用解释器和扫描器的场景。
  - 每一个非空的 case 子句都必须有一个 break 语句，也可以通过 continue、throw 或者 return 来结束非空 case 语句。
- 断言 Assert
  - 在开发过程中，可以在条件表达式为 false 时使用 _`assert(条件, 可选信息);`_ 语句来打断代码的执行。
  - assert 的第一个参数可以是值为布尔值的任何表达式。
    - 如果表达式的值为 true，则断言成功，继续执行。
    - 如果表达式的值为 false，则断言失败，抛出一个 `AssertionError` 异常。
- 异常
  - Dart 的所有异常都是非必检异常，方法不必声明会抛出哪些异常，并且你也不必捕获任何异常。
  - Dart 提供了 `Exception` 和 `Error` 两种类型的异常以及它们一系列的子类，也可以定义自己的异常类型。
  - `throw` 异常
  - `try on catch finally` 异常
  - `rethrow` 异常

```dart
void baseControlTest() {
  var year = 2021;
  var number = 100;
  var flybyObjects = [1, 2, 3];

// Dart 的 if 语句中的条件必须是布尔值而不能为其它类型。
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

// 基本for循环
  // for (int month = 1; month <= 12; month++) {
  //   print(month);
  // }

// 在 Dart 语言中，for 循环中的闭包会自动捕获循环的 索引值 以避免 JavaScript 中一些常见的陷阱。
// 这个代码在js会打印2 2
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());

// 遍历的对象是一个可迭代对象（例如 List 或 Set），并且你不需要知道当前的遍历索引，可以使用for in
  for (final object in flybyObjects) {
    print(object);
  }

// while 循环会在执行循环体前先判断条件：
  while (year < 2016) {
    year += 1;
  }
  print("year is $year"); // 2021

// do-while 循环则会 先执行一遍循环体 再判断条件
  do {
    number += 1;
  } while (number < 60);

  print("year is $number"); // 101

// 使用 break 可以中断循环
// 使用 continue 可以跳过本次循环直接进入下一次循环
  for (int i = 0; i < 100; i++) {
    if (i < 5) {
      continue;
    }
    if (i >= 10) {
      break;
    }
    print("i is $i"); // 5 6 7 8 9
  }

  // Switch 语句在 Dart 中使用 == 来比较整数、字符串或编译时常量，
  // 比较的两个对象必须是同一个类型且不能是子类并且没有重写 == 操作符。
  // 枚举类型非常适合在 Switch 语句中使用。

  // 每一个非空的 case 子句都必须有一个 break 语句，
  // 也可以通过 continue、throw 或者 return 来结束非空 case 语句。
  // 不匹配任何 case 语句的情况下，会执行 default 子句中的代码。
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED': // 支持空的 case 语句，允许其以 fall-through 的形式执行。
    // break;               // 如果输入的是CLOSED，有break，直接返回。沒有break，返回PENDING的执行。
    case 'PENDING':
      print("executePending()");
      break;
    case 'APPROVED': // 非空 case 语句中想要实现 fall-through 的形式，可以使用 continue 语句配合 label 的方式实现:
      print("executeApproved()");
      continue nowApproved;
    case 'DENIED':
      print("executeDenied()");
      break;
    nowApproved:
    case 'OPEN': // Runs for both APPROVED and OPEN.
      print("executeOpen()");
      break;
    default:
      print("executeUnknown()");
  }

  // 在开发过程中，可以在条件表达式为 false 时使用 — assert(条件, 可选信息); — 语句来打断代码的执行。
  // 第二个参数可以为其添加一个字符串消息。
  var text, num, urlString;
  // Make sure the variable has a non-null value.
  assert(text != null);

// Make sure the value is less than 100.
  assert(num < 100);

// Make sure this is an https URL.
  assert(urlString.startsWith('https'),
      'URL ($urlString) should start with "https".');

  // assert 的第一个参数可以是值为布尔值的任何表达式。如果表达式的值为 true，则断言成功，继续执行。
  // 如果表达式的值为 false，则断言失败，抛出一个 AssertionError 异常。
}

// Dart 代码可以抛出和捕获异常。
// 与 Java 不同的是，Dart 的所有异常都是非必检异常，方法不必声明会抛出哪些异常，并且你也不必捕获任何异常。
void distanceTo(int other) => throw UnimplementedError("异常信息");

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } on NoSuchMethodError catch (e) {
    // 使用 on 来指定异常类型，使用 catch 来捕获异常对象，两者可同时使用。
    print('NoSuchMethodError: $e');
    // 关键字 rethrow 可以将捕获的异常再次抛出
    rethrow; // Allow callers to see the exception.
  } catch (e) {
    // 如果 catch 语句没有指定异常类型则表示可以捕获任意异常类型(在上面已经catch了，就不会到这里了)
    print('misbehave() partially handled ${e.runtimeType}.');
    // 关键字 rethrow 可以将捕获的异常再次抛出
    rethrow; // Allow callers to see the exception.
  } finally {
    // 无论是否抛出异常，finally 语句始终执行，
    // 如果没有指定 catch 语句来捕获异常，则异常会在执行完 finally 语句后抛出
    print("无论如何，都会执行在finally");
  }
}

void main() {
  baseControlTest();
  var text;
  assert(text != null);

  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
```

## note

- 和在 js 中的常用控制语句用法基本一致，沒什么特殊的。
