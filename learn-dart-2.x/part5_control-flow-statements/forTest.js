// js的闭包
var callbacks = [];
for (var i = 0; i < 2; i++) {
    callbacks.push(() => console.log(i));
}
callbacks.forEach((c) => c());
/**
 * JavaScript中的函数会形成了闭包。 闭包是由函数以及声明该函数的词法环境组合而成的。
 * 该环境包含了这个闭包创建时作用域内的任何局部变量。所以结果为2 2
 * 
 * 如果把var i 改为 let i，那打印结果就是 0 1
 */
