import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Comming soon",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900
                ),
            )),
          ],
        ),
      ),
    );
  }
}