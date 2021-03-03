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
    String town = "Köln";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Covwarn 2021",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    color: noRisk,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Risiko niedrig",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.info_sharp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height:40),
                          createTextWithIcon(Icons.coronavirus_sharp,
                              "Keine Begegnungen (24 Std.)"),
                          Divider(
                            height: 40,
                            color: Colors.grey[200],
                            thickness: 1,
                          ),
                          createTextWithIcon(
                              Icons.location_on, "Gegend sicher"),
                          Divider(
                            height: 40,
                            color: Colors.grey[200],
                            thickness: 1,
                          ),
                          createTextWithIcon(
                              Icons.update_sharp, "Aktualisiert: Heute 11:11"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.zero,
                  color: Colors.grey[700],
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Übersicht ($town)",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            

                            Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        createTextWithIcon(Icons.accessibility_new_rounded,
                            "7-tage Inzidenz: 63"),
                        Divider(
                          height: 40,
                          color: Colors.grey[900],
                          thickness: 1,
                        ),
                        createTextWithImageIcon(
                            "assets/death.png", "Gestorben: 2.000"),
                        Divider(
                          height: 40,
                          color: Colors.grey[900],
                          thickness: 1,
                        ),

                        createTextWithImageIcon(
                            "assets/syringe.png", "Impfungen: 18.000"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
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
        selectedItemColor: noRisk,
        unselectedItemColor: Colors.white,
        //onTap: _onItemTapped,
      ),
    );
  }

  Widget createTextWithIcon(IconData icon, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        )
      ],
    );
  }

  Widget createTextWithImageIcon(String icon, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: ImageIcon(
            AssetImage(icon),
            color: Colors.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        )
      ],
    );
  }
}
