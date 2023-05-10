<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [库和可见性(Libraries and visibility)](#%E5%BA%93%E5%92%8C%E5%8F%AF%E8%A7%81%E6%80%A7libraries-and-visibility)
  - [使用库](#%E4%BD%BF%E7%94%A8%E5%BA%93)
  - [指定库前缀](#%E6%8C%87%E5%AE%9A%E5%BA%93%E5%89%8D%E7%BC%80)
  - [导入库的一部分](#%E5%AF%BC%E5%85%A5%E5%BA%93%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86)
  - [延迟加载(懒加载)库](#%E5%BB%B6%E8%BF%9F%E5%8A%A0%E8%BD%BD%E6%87%92%E5%8A%A0%E8%BD%BD%E5%BA%93)
- [异步支持(Asynchrony support)](#%E5%BC%82%E6%AD%A5%E6%94%AF%E6%8C%81asynchrony-support)
  - [处理 Future](#%E5%A4%84%E7%90%86-future)
  - [声明异步函数](#%E5%A3%B0%E6%98%8E%E5%BC%82%E6%AD%A5%E5%87%BD%E6%95%B0)
  - [处理 Stream](#%E5%A4%84%E7%90%86-stream)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 库和可见性(Libraries and visibility)

`import` 和 `library` 关键字可以帮助你创建一个模块化和可共享的代码库。  
代码库不仅只是提供 API 而且还起到了封装的作用：以下划线（\_）开头的成员仅在代码库中可见。  
每个 Dart 程序都是一个库，即便没有使用关键字 library 指定。  
Dart 的库可以使用 包工具(packages) 来发布和部署。

## 使用库

使用 `import` 来指定命名空间以便其它库可以访问。

- import 的唯一参数是用于指定代码库的 URI，
  - 对于 Dart 内置的库，使用 `dart:xxxxxx` 的形式。
  - 而对于其它的库，你可以使用一个文件系统路径或者以 `package:xxxxxx` 的形式。
    - `package:xxxxxx` 指定的库通过包管理器（比如 pub 工具）来提供

```dart
import 'dart:html';
import 'package:test/test.dart';
```

URI 代表统一资源标识符。  
URL（统一资源定位符）是一种常见的 URI。

## 指定库前缀

如果导入的两个代码库有冲突的标识符，可以为其中一个指定前缀。

```dart
// 比如如果 library1 和 library2 都有 Element 类
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// Uses Element from lib1.
Element element1 = Element();

// Uses Element from lib2.
lib2.Element element2 = lib2.Element();
```

## 导入库的一部分

如果只想使用代码库中的一部分，可以有选择地导入代码库。关键字 `show` 和 `hide`。

```dart
// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;
```

## 延迟加载(懒加载)库

可能使用到延迟加载的场景：

- 为了减少应用的初始化时间。
- 处理 A/B 测试，比如测试各种算法的不同实现。
- 加载很少会使用到的功能，比如可选的屏幕和对话框。

使用 `deferred as` 关键字来标识需要延时加载的代码库。  
当实际需要使用到库中 API 时先调用 `loadLibrary` 函数加载库。

- `loadLibrary` 函数可以调用多次也没关系，代码库只会被加载一次。

```dart
import 'package:greetings/hello.dart' deferred as hello;

Future<void> greet() async {
  // 使用 await 关键字暂停代码执行直到库加载完成。
  await hello.loadLibrary();
  hello.printGreeting();
}
```

延迟加载注意事项：

- 延迟加载的代码库中的常量需要在代码库被加载的时候才会导入，未加载时是不会导入的。
- 导入文件的时候无法使用延迟加载库中的类型。如果你需要使用类型，则考虑把接口类型转移到另一个库中然后让两个库都分别导入这个接口库。
- Dart 会隐式地将 `loadLibrary()` 导入到使用了 `deferred as` 命名空间 的类中。 `loadLibrary()` 函数返回的是一个 `Future`。

[实现库](https://dart.cn/guides/libraries/create-library-packages)

# 异步支持(Asynchrony support)

Dart 代码库中有大量返回 `Future` 或 `Stream` 对象的函数，这些函数都是 异步 的，它们会在耗时操作（比如 I/O）执行完毕前直接返回而不会等待耗时操作执行完毕。

`async` 和 `await` 关键字用于实现异步编程，并且让代码看起来就像是同步的一样。

## 处理 Future

可以通过下面两种方式，获得 Future 执行完成的结果：

- 使用 `async` 和 `await`;
- 使用 `Future API`.

使用 `async` 和 `await` 的**代码是异步**的，但是**看起来有点像同步代码**。

- 必须在带有 `async` 关键字的 **异步函数** 中使用 `await`。

```dart
Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
```

> 尽管异步函数可以处理耗时操作，但是它并不会等待这些耗时操作完成，异步函数执行时会在其遇到第一个 `await` 表达式（代码行）时返回一个 `Future` 对象，然后等待 `await` 表达式执行完毕后继续执行。

使用 `try、catch` 以及 `finally` 来处理使用 `await` 导致的异常。

```dart
try {
  version = await lookUpVersion();
} catch (e) {
  // React to inability to look up the version
}
```

可以在异步函数中多次使用 await 关键字。

```dart
var entrypoint = await findEntryPoint();
var exitCode = await runExecutable(entrypoint, args);
await flushThenExit(exitCode);
```

> `await` 表达式的返回值通常是一个 `Future` 对象；如果不是的话也会自动将其包裹在一个 `Future` 对象里。 `Future` 对象代表一个“promise”， `await` 表达式会阻塞直到需要的对象返回。

> 如果在使用 `await` 时导致编译错误，请确保 `await` 在一个异步函数中使用。

## 声明异步函数

**异步函数** 是函数体由 `async` 关键字标记的函数。

- 将关键字 async 添加到函数并让其返回一个 `Future` 对象。

```dart
Future<String> lookUpVersion() async => '1.0.0';
```

> 函数体不需要使用 `Future API`。如有必要，Dart 会创建 `Future` 对象。  
> 如果函数没有返回有效值，需要设置其返回类型为 `Future<void>`。

[异步编程：使用 Future 和 async-await](https://dart.cn/codelabs/async-await)

## 处理 Stream

如果想从 `Stream` 中获取值，可以有两种选择：

- 使用 `async` 关键字和一个 `异步循环`（使用 `await for` 关键字标识）。
- 使用 `Stream API`

> 在使用 `await for` 关键字前，确保其可以令代码逻辑更加清晰并且是真的需要等待所有的结果执行完毕。  
> 例如，通常不应该在 UI 事件监听器上使用 `await for` 关键字，因为 UI 框架发出的事件流是无穷尽的。

```dart
await for (varOrType identifier in expression) {
  // Executes each time the stream emits a value.
}
```

表达式(expression) 的类型必须是 Stream。执行流程如下：

- 1 等待直到 Stream 返回一个数据。
- 2 使用 1 中 Stream 返回的数据执行循环体。
- 3 重复 1、2 过程直到 Stream 数据返回完毕。

使用 `break` 和 `return` 语句可以停止接收 Stream 数据，这样就跳出了循环并取消注册监听 Stream。

**如果在实现异步 for 循环时遇到编译时错误，请检查确保 await for 处于异步函数中。**

```dart
void main() async {
  // ...
  await for (final request in requestServer) {
    handleRequest(request);
  }
  // ...
}
```
