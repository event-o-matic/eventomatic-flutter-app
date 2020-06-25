import 'package:eventomatic/all_users.dart';
import 'package:eventomatic/profile.dart';
import 'package:eventomatic/qr_scanner.dart';
import 'package:eventomatic/utils/theme_colors.dart';
import 'package:eventomatic/viewmodels/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final String _profileImage = "assets/profileimage.jpg";

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AuthViewModel>(context);

    return Scaffold(

//      appBar: AppBar(
//
//        backgroundColor: Color(0xFF102733),
//        title: Text("Select Utility to scan QR Code"),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: ThemeColors.primary,
            expandedHeight: 213,
            pinned: true,
//            titleSpacing: 5,
            leading: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllUserScreen(),
                      fullscreenDialog: false)),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfilePage(user: model.user,isMyProfilePage: true,)));
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
                          color: ThemeColors.orange,
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
