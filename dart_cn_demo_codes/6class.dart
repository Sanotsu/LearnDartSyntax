// Abstract classes can't be instantiated.
abstract class Item {
  use();
}

// Classes can implement other classes.
class Chest<T> implements Item {
  List<T> contents;
  // Constructors can assign arguments to instance variables using `this`.
  Chest(this.contents);
  use() => print("$this has ${contents.length} items.");
}

class Sword implements Item {
  int damage = 5;
  use() => print("$this dealt $damage damage.");
}

// Classes can extend other classes.
class DiamondSword extends Sword {
  int damage = 50;
}

main() {
  // The 'new' keyword is optional.
  var chest = Chest<Item>([
    DiamondSword(),
    Sword(),
  ]);
  chest.use();
  for (var item in chest.contents) {
    item.use();
  }
}
