
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => UI(),
  },
));

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    Color noRisk = Color(0xff6BAC66);
    Color slightRisk = Color(0xffF99246);
    Color infection = Color(0xffBF4448);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Covwarn 2021",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    color: noRisk,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Risiko niedrig",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white
                                  ),
                                ),
                                Icon(Icons.info_sharp, color: Colors.white,),
                              ],
                            ),
                          ),
                          
                          createTextWithIcon(Icons.coronavirus_sharp, "Keine Begegnungen"),
                          Divider(height: 40,color: Colors.grey[850],thickness: 1,),
                          createTextWithIcon(Icons.location_on, "Gegend sicher"),
                          Divider(height: 40,color: Colors.grey[850],thickness: 1,),
                          createTextWithIcon(Icons.update_sharp, "Aktualisiert: Heute 11:11"),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
      ),
    );
  }
  Widget createTextWithIcon(IconData icon, String text){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(icon, color: Colors.white,),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22
          ),
        )
      ],
    );
  }
}
