import 'dart:convert';
import 'package:covwarn/home.dart';
import 'package:covwarn/info.dart';
import 'package:covwarn/map.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => UI(),
        "/home": (context) => HomeScreen(),
        "/map": (context) => HeatMap(),
        "/info": (context) => AboutScreen(),
      },
    ));

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  String koeln = "05315";
  String bonn = "05314";
  String frankfurt = "06412";
  String hannover = "03241";
  String freiburg = "08311";
  String muenchen = "09162";

  void fetchData() async {
    String town = koeln;
    Response response =
        await http.get(Uri.https("api.corona-zahlen.org", "/districts/$town"));
    Map<String, dynamic> jsonResponse = await jsonDecode(response.body);

    Map mainData = jsonResponse["data"];
    Map extractedData = mainData[town];
    Map timeData = jsonResponse["meta"];

    //print(jsonResponse);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "mainData": extractedData,
        "updateTime": timeData,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Covwarn",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 300),
              Transform.scale(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
                scale: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
