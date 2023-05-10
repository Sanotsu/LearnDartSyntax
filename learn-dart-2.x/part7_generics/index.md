<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [为什么使用泛型？](#%E4%B8%BA%E4%BB%80%E4%B9%88%E4%BD%BF%E7%94%A8%E6%B3%9B%E5%9E%8B)
- [使用集合字面量(Using collection literals)](#%E4%BD%BF%E7%94%A8%E9%9B%86%E5%90%88%E5%AD%97%E9%9D%A2%E9%87%8Fusing-collection-literals)
- [使用类型参数化的构造函数](#%E4%BD%BF%E7%94%A8%E7%B1%BB%E5%9E%8B%E5%8F%82%E6%95%B0%E5%8C%96%E7%9A%84%E6%9E%84%E9%80%A0%E5%87%BD%E6%95%B0)
- [泛型集合以及它们所包含的类型](#%E6%B3%9B%E5%9E%8B%E9%9B%86%E5%90%88%E4%BB%A5%E5%8F%8A%E5%AE%83%E4%BB%AC%E6%89%80%E5%8C%85%E5%90%AB%E7%9A%84%E7%B1%BB%E5%9E%8B)
- [限制参数化类型](#%E9%99%90%E5%88%B6%E5%8F%82%E6%95%B0%E5%8C%96%E7%B1%BB%E5%9E%8B)
- [使用泛型方法](#%E4%BD%BF%E7%94%A8%E6%B3%9B%E5%9E%8B%E6%96%B9%E6%B3%95)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

如果查看数组的 API 文档，会发现数组 `List` 的实际类型为` List<E>`。

- `<…>` 符号表示数组是一个 `泛型(generic)`（或 `参数化类型(parameterized)）`, **通常使用一个字母来代表类型参数**，比如 E、T、S、K 和 V 等等。

## 为什么使用泛型？

泛型常用于需要要求类型安全的情况，但是它也会对代码运行有好处：

- 适当地指定泛型可以更好地帮助代码生成。
- 使用泛型可以减少代码重复。

## 使用集合字面量(Using collection literals)

List、Set 以及 Map 字面量也可以是参数化的。

- 定义参数化的 List 只需在中括号前添加 `<type>`；
- 定义参数化的 Map 只需要在大括号前添加 `<keyType, valueType>`：

```dart
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};
```

## 使用类型参数化的构造函数

调用构造方法时也可以使用泛型，只需在类名后用尖括号（`<...>`）将一个或多个类型包裹即可：

```dart
var nameSet = Set<String>.from(names);
// 下面代码创建了一个键为 Int 类型，值为 View 类型的 Map 对象：
var views = Map<int, View>();
```

## 泛型集合以及它们所包含的类型

Dart 的泛型类型是 **固化的(reified)**，这意味着即便在运行时也会保持类型信息。

```dart
var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
print(names is List<String>); // true
```

> 与 Java 不同的是，Java 中的泛型是类型 **擦除(erasure)** 的，这意味着泛型类型会在运行时被移除。在 Java 中你可以判断对象是否为 List 但不可以判断对象是否为 `List<String>`。

## 限制参数化类型

有时**使用泛型**的时候，可能会想**限制可作为参数的泛型范围**，也就是参数必须是指定类型的子类，这时候**可以使用 `extends` 关键字**。

- 一种常见的非空类型处理方式，是将子类限制继承 `Object` （而不是默认的 `Object?`）。
- 除了对象之外，还可以将扩展与其他类型一起使用。

```dart
// 子类限制继承 `Object`
class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}
// 下面是一个扩展SomeBaseClass的示例，以便可以在T类型的对象上调用SomeBaseClass的成员
class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}
class Extender extends SomeBaseClass {...}

// 这时候就可以使用 SomeBaseClass 或者它的子类来作为泛型参数：
var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();
```

## 使用泛型方法

起初 Dart 只支持在类的声明时指定泛型，现在同样也可以在方法上使用泛型，称之为 泛型方法(generic methods)。

```dart
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
/*
方法 first<T> 的泛型 T 可以在如下地方使用：
    函数的返回值类型 (T)。
    参数的类型 (List<T>)。
    局部变量的类型 (T tmp)。
*/
```
