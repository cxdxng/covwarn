import 'package:http/http.dart' as http;

class GetData {
  void fetchData() async {
    var response = await http.get(Uri.https("https://interaktiv.morgenpost.de",
        "/corona-virus-karte-infektionen-deutschland-weltweit/"));
  }
}
