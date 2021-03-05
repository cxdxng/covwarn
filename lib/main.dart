import 'dart:convert';
import 'package:covwarn/home.dart';
import 'package:covwarn/map.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => UI(),
        "/home": (context) => HomeScreen(),
        "/map": (context) => HeatMap(),
      },
    ));

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}



class _UIState extends State<UI> {

  void fetchData()async{
    var response = await http.get(Uri.https("api.corona-zahlen.org","/districts/05315"));
    Map<String, dynamic> jsonResponse = await jsonDecode(response.body);
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, "/home", arguments: {"cachedData": jsonResponse});
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
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900
                ),
              ),
              SizedBox(height: 300),
              Transform.scale(child: CircularProgressIndicator(strokeWidth: 3,), scale: 2,)
            ],
          ),
        ),
      ),
    );

    
  }
}
