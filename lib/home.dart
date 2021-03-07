import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color noRisk = Color(0xff6BAC66);
  Color slightRisk = Color(0xffF99246);
  Color infection = Color(0xffBF4448);

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;
    
    var mainData = data["mainData"];
    var timeData = data["updateTime"];
    String updated = timeData["lastUpdate"].toString();
    String lastUpdate = formatTime(updated);

    
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text(
          "Covwarn 2021",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Risc Card
              Center(
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
                          ],
                        ),
                        SizedBox(height:20),
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
                            Icons.update_sharp, "Aktualisiert: $lastUpdate"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Overwiew Card
              Center(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.zero,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Übersicht (${mainData["name"]})",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        createTextWithIcon(Icons.trending_up_sharp,
                            "7-tage Inzidenz: ${double.parse(mainData["weekIncidence"].toString()).toStringAsFixed(2)}"),
                        Divider(
                          height: 40,
                          color: Colors.white,
                          thickness: 1,
                        ),

                        createTextWithIcon(Icons.masks_outlined, "Infektionen: ${mainData["cases"]}"),

                        Divider(
                          height: 40,
                          color: Colors.white,
                          thickness: 1,
                        ),
                        createTextWithImageIcon(
                            "assets/death.png", "Todesfälle: ${mainData["deaths"]}"),
                        

                        // Other Widgets here
                        
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Show Map
              Center(
                child: Card(
                
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.zero,
                  color: Colors.black,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, "/map"),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Karte anzeigen",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              

              SizedBox(height: 10),

              Center(
                child: Card(
                
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.zero,
                  color: infection,
                  child: InkWell(
                    onTap: (){
                      confirmationPopup(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Infektion melden",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              


              // Other Widgets here

            ],
          ),
        ),
      ),
      
    );
  }

  String formatTime(String time){
    DateFormat format = DateFormat('dd.MM.yyyy, HH:mm');
    DateTime updateTime = DateTime.parse(time);
    return format.format(updateTime);
  }

  confirmationPopup(BuildContext dialogContext) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PlatformAlertDialog(
          title: Text("Sind Sie sicher?", style: TextStyle(fontSize: 30),),
          content: SingleChildScrollView(
            child: Text("Dieser Vorgang kann nicht Rückgängig gemacht weden", style: TextStyle(fontSize: 20),),
          ),
          actions: <Widget>[
            PlatformDialogAction(
              
              child: Text("Nein, ich bin Negativ"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            PlatformDialogAction(
              child: Text("Ja, ich bin Infiziert"),
              actionType: ActionType.Destructive,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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