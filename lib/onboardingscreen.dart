import 'package:eventomatic/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  final Color bgColor;
  final String text;
  final String image;
  final bool light;
  final bool dark;
  final bool firstPage;
  final bool isLastPage;


  OnBoardingScreen({
    this.bgColor,
    this.text,
    this.image,
    this.light = false,
    this.isLastPage = false,
    this.firstPage=true,
    this.dark=true,


  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: light ? Colors.black : Colors.white,
    );
    TextStyle content = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: light ? Colors.black : Colors.white,
    );

    Decoration firstDecoration = BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.9],
              colors: [Colors.white, Color(0xFF102733),])

    );

    Decoration secondDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.6],
            colors: [Color(0xFFF74E2E), Color(0xFF102733),])

    );



    return Scaffold(

      body: Container(
        decoration: firstPage ? firstDecoration: secondDecoration,
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Center(
              child: Image.asset(
                image,
                height: 400,
                width: 300,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$text",
              style: textStyle,
            ),
            SizedBox(
              height: 160,
            ),
            isLastPage
                ? Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 10),
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("GET STARTED"),
                      textColor: Color(0xFF102733),

                    ))
                : Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "NEXT  >>",
                      style: content,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
