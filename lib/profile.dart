import 'package:eventomatic/login.dart';
import 'package:eventomatic/main.dart';
import 'package:eventomatic/models/user.dart';
import 'package:eventomatic/utils/theme_colors.dart';
import 'package:eventomatic/viewmodels/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  final isMyProfilePage;

  const UserProfilePage({Key key, @required this.user, this.isMyProfilePage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final model = Provider.of<AuthViewModel>(context);
    TextStyle detailStyle = TextStyle(
//      fontFamily: 'Roboto',
      color: ThemeColors.primary,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );

    Widget _coverImage() {
      return Container(
        padding: EdgeInsets.all(20.0),
        height: screenSize.height / 2.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/appbar.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _profilePicture() {
      return Center(
        child: Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user.avatar),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80),
            border: Border.all(
              color:Colors.white,
              width: 10.0,
            ),
          ),
        ),
      );
    }

    Widget _fullName() {
      TextStyle _textStyle = TextStyle(
        color: ThemeColors.primary,
        fontFamily: 'Roboto',
        fontSize: 28,
        fontWeight: FontWeight.w700,
      );

      return Text(
        user.name,
        style: _textStyle,
      );
    }

    Widget _buildStatus(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: ThemeColors.orange,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          user.role,
          style: TextStyle(
            fontFamily: 'Spectral',
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget _comp() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Text(user.gender, style: detailStyle),
      );
    }

    Widget _contact() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Text(
          "Contact: ${user.phone}",
          style: detailStyle,
        ),
      );
    }

    Widget _mail() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Text(
          "E-mail: ${user.email}",
          style: detailStyle,
        ),
      );
    }

    return Scaffold(
//      backgroundColor: Color(0xFF102733),
      appBar: AppBar(
        backgroundColor: ThemeColors.primary,
        title: Text(
          '${user.name}\'s Profile',
        ),
      ),
      body: user == null
          ? Center(
              child: Text("Not LoggedIn!"),
            )
          : Stack(
              children: <Widget>[
                _coverImage(),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: screenSize.height / 3.6),
                      _profilePicture(),
                      SizedBox(height: 10),
                      _fullName(),
                      SizedBox(height: 10),
                      _buildStatus(context),
                      SizedBox(height: 10),
                      _comp(),
                      SizedBox(height: 10),
                      _contact(),
                      SizedBox(height: 10),
                      _mail(),
                      SizedBox(height: 10),
                      if(isMyProfilePage)
                      RaisedButton(
                        color: ThemeColors.orange,
                        onPressed: () {
                          model.signOut();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text("Logout",style: TextStyle(
                          fontFamily: 'Spectral',
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
