/**
 * Dart 是一种真正面向对象的语言，所以即便函数也是对象并且类型为 Function，
 * 这意味着函数可以被赋值给变量或者作为其它函数的参数。
 * 你也可以像调用函数一样调用 Dart 类的实例。
 */

// 建议 为每个函数的参数以及返回值都指定类型
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// => (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用.
// 在 => 与 ; 之间的只能是 表达式 而非 语句。
bool isEven(int number) => number % 2 == 0;

/**
 * 参数
 * 必要参数 和 可选参数：
 *    必要参数定义在参数列表前面，可选参数则定义在必要参数后面。
 *    可选参数可以是 命名的 或 位置的。
 *    （简单理解：不是可选的位置参数就是必要参数）
 * 
 * 命名参数：
 *    定义函数时，使用 {参数1, 参数2, …} 来指定命名参数。
 *    默认为可选参数，除非他们被特别标记为 required。
 * 可选的位置参数:
 *    使用 [] 将一系列参数包裹起来作为位置参数。
 *    不用[]或者{}那就是必填的位置参数了。
 * 
 * 默认参数值
 *    可以用 = 为函数的命名参数和位置参数定义默认值，
 *    默认值必须为编译时常量，没有指定默认值的情况下默认值为 null。

 * 可选位置参数和可选命名参数不能混合在一起使用，因为可选参数列表只能位于整个函数形参列表的最后。
 * 
 */

String say(String from, String msg,
    [String? device, String? action = "Smile"]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device action is $action';
  }
  return result;
}

/**
 * 函数是一级对象
 * 可以将函数作为参数传递给另一个函数。
 */
// 最常用的，forEach的参数：
void printElement(int element) {
  print(element);
}

/**
 * 匿名函数
 * 大多数函数都是有名字的，比如 main() 或 printElement()。
 * 你可以创建一个没有名字的函数，称之为 匿名函数、 Lambda 表达式 或 Closure 闭包。
 * 你可以将匿名函数赋值给一个变量然后使用它，比如将该变量添加到集合或从中删除。
 * 匿名函数看起来与命名函数类似，在括号之间可以定义参数，参数之间用逗号分割。

    后面大括号中的内容则为函数体：
    ([[类型] 参数[, …]]) {
      函数体;
    };
 */

/**
 * 词法作用域
 * Dart 是词法有作用域语言，变量的作用域在写代码的时候就确定了，大括号内定义的变量只能在大括号内访问，与 Java 类似。
 */
bool topLevel = true;

/**
 * 词法闭包
 * 闭包 即一个函数对象，即使函数对象的调用在它原始作用域之外，依然能够访问在它词法作用域内的变量。
 * 函数可以封闭定义到它作用域内的变量。
 */
/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}
/**
 * 返回值
 * 所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 return null;。
 */

/**
 * main() 函数
 * 每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口，
 * main() 函数返回值为 void 并且有一个 List<String> 类型的可选参数。
 */
void main(List<String> args) {
  print(fibonacci(20));

  print(isEven(-5));

  print(say('Bob', 'Howdy'));
  print(say('Bob', 'Howdy', 'smoke signal'));

  assert(say('Bob', 'Howdy') == 'Bob says Howdy', "断言未通过");

  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal action is Smile');

// 最常见的函数作为参数传递
  var list = [1, 2, 3];
  list.forEach(printElement);

// 或者将函数赋值给一个变量
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');

  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

//  nestedFunction() 函数可以访问包括顶层变量在内的所有的变量。
    void nestedFunction() {
      var insideNestedFunction = true;

// 以下都可以通过
      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }

    nestedFunction();
  }

  myFunction();

  // Create a function that adds 2.
  var add2 = makeAdder(2); // add2就是(int i) => 2 + i;

  // Create a function that adds 4.
  var add4 = makeAdder(4); // add4就是(int i) => 4 + i;

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}


/**
 * note：
 * 1 和js的函数基本类似，注意函数的命名参数和可选位置参数不能同时用。
 * 2 每个函数都有返回值，如果是void，则是省略了return null。
 * 3 也是有闭包，注意闭包的两个主要目的即可：
 *      一个是可以在全局作用域中读取内部函数的的变量，
 *      另一个就是可以让闭包中引用的变量始终保存在内存中。
 * 4 每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口。
 * 
 */