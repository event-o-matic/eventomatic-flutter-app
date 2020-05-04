import 'package:eventomatic/profile.dart';
import 'package:eventomatic/qr_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const allowedUtils = [
  "CHECKIN",
  "REGKIT",
  "BREAKFAST",
  "LUNCH",
  "DINNER",
  "PRIZE",
  "CERTIFICATE",
];

class UtilitiesScreen extends StatelessWidget {
  final String _profileImage = "assets/profileimage.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102733),
//      appBar: AppBar(
//
//        backgroundColor: Color(0xFF102733),
//        title: Text("Select Utility to scan QR Code"),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFF102733),
            expandedHeight: 213,
            pinned: true,
//            titleSpacing: 5,

            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfilePage()));
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(_profileImage),
                  ),
                ),
              )
//
            ],
            flexibleSpace: new FlexibleSpaceBar(
              title: Text('Eventomatic'),
              centerTitle: true,
              background: Image.asset("assets/appbar.jpg"),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => new Center(
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: allowedUtils
                      .map(
                        (util) => RaisedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QRScanner(util: util),
                            ),
                          ),
                          color: Color(0xFF29404E),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.check,
                                  size: 70,
                                  color: Colors.white,
                                ),
                                Text(
                                  util,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
