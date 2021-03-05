import 'dart:convert';

import 'package:http/http.dart' as http;

class GetData {
  void fetchData() async {
    var response = await http.get(Uri.https("https://api.corona-zahlen.org","/districts/05315"));
    print(jsonDecode(response.body));

  }
}
