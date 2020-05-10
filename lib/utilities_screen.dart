import 'package:eventomatic/data/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:eventomatic/qr_scanner.dart';

const allowedUtils = [
  "checkin",
  "regkit",
  "breakfast",
  "lunch",
  "dinner",
  "prize",
  "certificate",
];

class UtilitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Utility to scan QR Code"),
      ),
      body: Center(
        child: GridView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: events[0].schedule.where((s) => s.isConsumable).toList()
              .map((s) => RaisedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRScanner(util: s.title),
                      ),
                    ),
                    child: Text(
                      s.title,
                      style: TextStyle(fontSize: 18),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
