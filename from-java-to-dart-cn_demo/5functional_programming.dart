// ${'a' * length} 这样的代码执行效果是将字符 'a' 重复 length 次
String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [1, 2, 3, 5, 10, 50];
  // 以下兩個打印是一樣的
  // 命令式
  for (var length in values) {
    print(scream(length));
  }
  // 函数式
  values.map(scream).forEach(print);

// 更多函數式特性
// skip(1) 会忽略迭代中的第一个值
// take(3)会获取接下来的 3 个值，也就是 2，3 和 5
// 剩下的值都会被忽略掉
  values.skip(1).take(3).map(scream).forEach(print);
}
