import 'package:eventomatic/login.dart';
import 'package:eventomatic/utilities_screen.dart';
import 'package:eventomatic/viewmodels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eventomatic',
        theme: ThemeData(
//        primaryColor: Colors.deepPurple,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class Startup extends StatefulWidget {
  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    final authModel = Provider.of<AuthViewModel>(context,listen: false);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => authModel.isUserLoggedIn ? UtilitiesScreen() : LoginPage()
    ));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);
  }
}

