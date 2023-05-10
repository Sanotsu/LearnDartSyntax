<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [算术运算符](#%E7%AE%97%E6%9C%AF%E8%BF%90%E7%AE%97%E7%AC%A6)
- [关系运算符](#%E5%85%B3%E7%B3%BB%E8%BF%90%E7%AE%97%E7%AC%A6)
- [类型判断运算符](#%E7%B1%BB%E5%9E%8B%E5%88%A4%E6%96%AD%E8%BF%90%E7%AE%97%E7%AC%A6)
- [赋值运算符](#%E8%B5%8B%E5%80%BC%E8%BF%90%E7%AE%97%E7%AC%A6)
- [逻辑运算符](#%E9%80%BB%E8%BE%91%E8%BF%90%E7%AE%97%E7%AC%A6)
- [按位和移位运算符](#%E6%8C%89%E4%BD%8D%E5%92%8C%E7%A7%BB%E4%BD%8D%E8%BF%90%E7%AE%97%E7%AC%A6)
- [条件表达式](#%E6%9D%A1%E4%BB%B6%E8%A1%A8%E8%BE%BE%E5%BC%8F)
- [级联运算符](#%E7%BA%A7%E8%81%94%E8%BF%90%E7%AE%97%E7%AC%A6)
- [其他运算符](#%E5%85%B6%E4%BB%96%E8%BF%90%E7%AE%97%E7%AC%A6)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 算术运算符

| 运算符  | 描述                                       |
| ------- | ------------------------------------------ |
| +       | 加                                         |
| –       | 减                                         |
| -表达式 | 一元负, 也可以作为反转（反转表达式的符号） |
| \*      | 乘                                         |
| /       | 除                                         |
| ~/      | 除并取整                                   |
| %       | 取模                                       |
| ++var   | var = var + 1 (表达式的值为 var + 1)       |
| var++   | var = var + 1 (表达式的值为 var)           |
| --var   | var = var – 1 (表达式的值为 var – 1)       |
| var--   | var = var – 1 (表达式的值为 var)           |

## 关系运算符

| 运算符 | 描述     |
| ------ | -------- |
| ==     | 相等     |
| !=     | 不等     |
| \>     | 大于     |
| \<     | 小于     |
| >=     | 大于等于 |
| <=     | 小于等于 |

**要判断两个对象(objects) x 和 y 是否表示相同的事物使用 `==` 即可。**

`==` 运算符的一些规则:

- 当 x 和 y 同时为空时返回 true，而只有一个为空时返回 false。
- 返回对 x 调用 `==` 方法的结果，参数为 y。（像 `==` 这样的操作符是对左侧内容进行调用的。)

## 类型判断运算符

`as`、`i`s、`is!` 运算符是在运行时判断对象类型的运算符。
| 运算符 | 描述 |
| ------ | -------- |
| as| 类型转换（也用作指定 类前缀)）|
| is| 如果对象是指定类型则返回 true|
| is!| 如果对象是指定类型则返回 false|

当且仅当 `obj` 实现了 T 的接口，`obj is T` 才是 true。

例如 `obj is Object` 总为 true，因为所有类都是 Object 的子类。  
仅当你确定这个对象是该类型的时候，你才可以使用 `as` 操作符可以把对象转换为特定的类型。

```dart
(employee as Person).firstName = 'Bob';

// 如果你不确定这个对象类型是不是 T，请在转型前使用 is T 检查类型。

if (employee is Person) {
  // Type check
  employee.firstName = 'Bob';
}

// 上述两种方式是有区别的：如果 employee 为 null 或者不为 Person 类型，则第一种方式将会抛出异常，而第二种不会。
```

## 赋值运算符

可以使用 `=` 来赋值，同时也可以使用 `??=` 来为值为 null 的变量赋值。

```dart
// Assign value to a
a = value;
// Assign value to b if b is null; otherwise, b stays the same
// b为null则赋值为value，否则还是b
b ??= value;
```

**`+=` 这样的赋值运算符将算数运算符和赋值运算符组合在了一起**  
| | | | | |
| ------ | -------- |-------- |-------- |-------- |
|= |\*= |%=| >>>=| ^=|
|+=| /=| <<=| &= |=|
|-=| ~/=| >>=|

eg:  
**`a op= b` ==> `a = a op b`**  
`a += b` ==> `a = a + b`

## 逻辑运算符

| 运算符  | 描述                                                      |
| ------- | --------------------------------------------------------- |
| !表达式 | 对表达式结果取反（即将 true 变为 false，false 变为 true） |
| \|\|    | 逻辑或                                                    |
| &&      | 逻辑与                                                    |

## 按位和移位运算符

在 Dart 中，二进制位运算符可以操作二进制的某一位，**但仅适用于整数**。
| 运算符 | 描述 |
| ------- | ----|
|& |按位与|
|\| |按位或|
|^| 按位异或|
|~表达式| 按位取反（即将 “0” 变为 “1”，“1” 变为 “0”）|
|<<| 位左移|
|>> |位右移|
|>>> |无符号右移|

**`>>>` 操作符在 2.14 以上的 Dart 版本 中可用。**

## 条件表达式

_条件 ? 表达式 1 : 表达式 2_  
如果条件为 true，执行表达式 1 并返回执行结果，否则执行表达式 2 并返回执行结果。

_表达式 1 ?? 表达式 2_  
如果表达式 1 为非 null 则返回其值，否则执行表达式 2 并返回其值。

```dart
// 根据布尔表达式确定赋值时，请考虑使用 ? 和 :
var visibility = isPublic ? 'public' : 'private';

// 如果赋值是根据判定是否为 null 则考虑使用 ??。
String playerName(String? name) => name ?? 'Guest';
```

## 级联运算符

级联运算符 (**`..`** 和 **`?..`**) 可以**在同一个对象上连续调用多个对象的变量或方法。**

```dart
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;

// 构造函数Paint()返回一个Paint对象。级联符号后面的代码对该对象进行操作，忽略任何可能返回的值。
// 等价于：
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
```

## 其他运算符

| 运算符 | 名字         | 描述                                                                                                                   |
| ------ | ------------ | ---------------------------------------------------------------------------------------------------------------------- |
| ()     | 使用方法     | 代表调用一个方法                                                                                                       |
| []     | 访问 List    | 访问 List 中特定位置的元素                                                                                             |
| ?[]    | 判空访问     | List 左侧调用者不为空时，访问 List 中特定位置的元素                                                                    |
| .      | 访问成员     | 成员访问符                                                                                                             |
| ?.     | 条件访问成员 | 与上述成员访问符类似，但是左边的操作对象不能为 null。<br/>例如 `foo?.bar`，如果 foo 为 null 则返回 null ，否则返回 bar |
