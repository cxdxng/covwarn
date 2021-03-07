import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';

class AboutScreen extends StatelessWidget {
  final Strategy strategy = Strategy.P2P_STAR;


  void discovery() async {
    try {
      bool a = await Nearby().startDiscovery("megaluul", strategy,
          onEndpointFound: (String lol, name, serviceId) async {
        print('I saw id with name:$name'); // the name here is an email

      }, onEndpointLost: (id) {
        print("id");
      });
      print('DISCOVERING: ${a.toString()}');
    } catch (e) {
      print(e);
    }
  }

  void getPermissions() {
    Nearby().askLocationAndExternalStoragePermission();
  }

  

  @override
  Widget build(BuildContext context) {
    getPermissions();
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Comming soon lool",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900
                ),
            )),
            Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 5.0,
              color: Colors.deepPurple[400],
              onPressed: () async {
                try {
                  bool a = await Nearby().startAdvertising(
                    "bekaakt",
                    strategy,
                    onConnectionInitiated: null,
                    onConnectionResult: (id, status) {
                      print(status);
                    },
                    onDisconnected: (id) {
                      print('Disconnected $id');
                    },
                  );

                  print('ADVERTISING ${a.toString()}');
                } catch (e) {
                  print(e);
                }

                discovery();
              },
              child: Text(
                'Start Tracing',
                
              ),
            ),
          ),

          RaisedButton(onPressed: (){
            Nearby().stopAdvertising();
            Nearby().stopDiscovery();
            
          },
          child: Text("Stop"),
          )
          ],
        ),
      ),
    );
  }
}