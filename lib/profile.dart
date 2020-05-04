import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String _name = "Dhrumil Pandya";
  final String _status = "Developer";
  final String _mobile = "9824343803";
  final String _email = "dvp2138433@gmail.com";
  final String _company = "Sustainix";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    TextStyle detailStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 20.0,
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
              image: AssetImage('assets/appbar.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80),
            border: Border.all(
              color: Color(0xFF29404E),
              width: 10.0,
            ),
          ),
        ),
      );
    }

    Widget _fullName() {
      TextStyle _textStyle = TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 28,
        fontWeight: FontWeight.w700,
      );

      return Text(
        _name,
        style: _textStyle,
      );
    }

    Widget _buildStatus(BuildContext context) {
      return Container(

        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: Color(0xFF29404E),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          _status,
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
        child: Text(
          "Company: $_company",
          style: detailStyle
        ),
      );
    }

    Widget _contact() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Text(
          "Contact: $_mobile",
          style: detailStyle,
        ),
      );
    }

    Widget _mail() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Text(
          "E-mail: $_email",
          style: detailStyle,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF102733),
      appBar: AppBar(
        backgroundColor:Color(0xFF102733),
        title: Text(
          'D.V\'s Profile',
        ),
      ),
      body: Stack(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
