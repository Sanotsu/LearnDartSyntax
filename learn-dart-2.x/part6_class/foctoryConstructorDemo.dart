class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front of its name.
  // 因为名称前的 _，所以 _cache为私有变量。
  static final Map<String, Logger> _cache = <String, Logger>{};

  // Logger 的工厂构造函数从缓存中返回对象，
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  // Logger.fromJson 工厂构造函数从 JSON 对象中初始化一个最终变量。
  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

// 把+ - 重寫为向量的+ -
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown.
  // ···
}

void main(List<String> args) {
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);
  loggerJson.log("s");

  final v = Vector(2, 3);
  final w = Vector(2, 2);

// 20211108 为什么断言失败呢？
  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}
