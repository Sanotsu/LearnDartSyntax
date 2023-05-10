# 导入库

## 使用 import 关键字来访问在其它库中定义的 API。

- import 的唯一参数是用于指定代码库的 URI，
- 对于 Dart 内置的库，使用 dart:xxxxxx 的形式。
- 而对于其它的库，你可以使用一个文件系统路径或者以 package:xxxxxx 的形式。
- package:xxxxxx 指定的库通过包管理器（比如 pub 工具）来提供。

```dart
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
import 'package:test/test.dart';

// Importing files
import '../part4_comments/index.dart';
```

- import 和 library 关键字可以帮助你创建一个模块化和可共享的代码库。
- 代码库不仅只是提供 API 而且还起到了封装的作用：以下划线（\_）开头的成员仅在代码库中可见。
- 每个 Dart 程序都是一个库，即便没有使用关键字 library 指定。
- Dart 的库可以使用 包工具 来发布和部署。

## 指定库前缀

如果你导入的两个代码库有冲突的标识符，你可以为其中一个指定前缀。比如如果 library1 和 library2 都有 Element 类，那么可以这么处理：

```dart
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// Uses Element from lib1.
Element element1 = Element();

// Uses Element from lib2.
lib2.Element element2 = lib2.Element();
```

## 导入库的一部分

如果你只想使用代码库中的一部分，你可以有选择地导入代码库。例如：

```dart
// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;
```

## 延迟加载库

延迟加载（也常称为 懒加载）允许应用在需要时再去加载代码库，下面是可能使用到延迟加载的场景：

- 为了减少应用的初始化时间。
- 处理 A/B 测试，比如测试各种算法的不同实现。
- 加载很少会使用到的功能，比如可选的屏幕和对话框。

使用 deferred as 关键字来标识需要延时加载的代码库：

```dart
import 'package:greetings/hello.dart' deferred as hello;
```

当实际需要使用到库中 API 时先调用 loadLibrary 函数加载库：

```dart
Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
```

在前面的代码，使用 await 关键字暂停代码执行直到库加载完成。  
**loadLibrary 函数可以调用多次也没关系，代码库只会被加载一次。**

当你使用延迟加载的时候需要牢记以下几点：

- 延迟加载的代码库中的常量需要在代码库被加载的时候才会导入，未加载时是不会导入的。
- 导入文件的时候无法使用延迟加载库中的类型。如果你需要使用类型，则考虑把接口类型转移到另一个库中然后让两个库都分别导入这个接口库。
- Dart 会隐式地将 loadLibrary() 导入到使用了 deferred as 命名空间 的类中。 loadLibrary() 函数返回的是一个 Future。

# [创建 package](https://dart.cn/guides/libraries/create-library-packages)
