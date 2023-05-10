import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> arguments) async {
  var page = 1;
  await fetchAlbum(page);
}

Future<dynamic> fetchAlbum(int page) async {
  final response =
      await http.get(Uri.parse('https://api.readhub.cn/topic/list?page=$page'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var a = jsonDecode(response.body);

    print(a);

    return a;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
