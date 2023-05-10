import 'package:characters/characters.dart';

var list = [1, 2, 3];
var list4;
var list5 = [0, ...?list4];

void main(List<String> args) {
  // 集合中的扩展操作符
  var list2 = [0, ...list];

  print(list2);
  print(list4);
  print(list5);

// 集合中的for
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);

//  const 关键字创建一个 Set 编译时常量
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium'); // This line will cause an error.

  print(constantSet);

  // Map构造器创建map
  var gifts = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  print(gifts);
  print(nobleGases);

// Runes 与 grapheme clusters demo
  var hi = 'Hi 🇩🇰';
  // 输出取决于运行的环境
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');
  print('\u2665'); // ♥
  print("\u{1f600}");
}
