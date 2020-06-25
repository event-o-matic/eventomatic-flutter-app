import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';

import 'OnBoardingScreen.dart';

class GooeyEdgeDemo extends StatefulWidget {
  @override
  _GooeyEdgeDemoState createState() => _GooeyEdgeDemoState();
}

class _GooeyEdgeDemoState extends State<GooeyEdgeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          Container(

//            color: Color(0xFF102733),
            child: OnBoardingScreen(

//              bgColor: Color(0xFF102733),
              image: "assets/what.png",
              text: "EVENTOMATIC IS AN E-MANAGERIAL SUPPORT PLATFORM",
            ),
          ),
          Container(
//            color: Color(0xFF102733),
            child: OnBoardingScreen(
              firstPage: false,
//              bgColor: Color(0xFF102733),
              image: "assets/how.png",
              text: "MAKES HANDY TO ORGANIZE EVENTS EVERY PHASE",

            ),
          ),
          Container(
//            color: Color(0xFF102733),
            child: OnBoardingScreen(

//              bgColor: Color(0xFF102733),
              image: "assets/us.png",
              text: "HELPING TEAMS MANAGE EVENTS HASSLE FREE",
              isLastPage: true,


            ),
          ),
        ],
      ),
    );
  }
}
