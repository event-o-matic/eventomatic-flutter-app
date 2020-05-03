import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'validator.dart';
import 'package:eventomatic/utilities_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  final TextStyle _textStyle = TextStyle(
    color: Colors.white,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventomatic"),
        backgroundColor: Color(0xFF102733),
      ),
      backgroundColor: Color(0xFF102733),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),

                Container(
                  width: 350,
                  child: TextFormField(
                    validator: emailValidator,
                    textDirection: TextDirection.ltr,
                    style: _textStyle,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      fillColor: Color(0xFF29404E),
                      filled: true,
                      labelStyle: _textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    style: _textStyle,
                    validator: passwordValidator,
                    textDirection: TextDirection.ltr,
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Color(0xFF29404E),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Password',
                      labelStyle: _textStyle,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.white,
                  child: Text('Forgot Password?'),
                ),
                Container(
                    height: 50,
                    width: 200,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xFF29404E),
                      child: Text('Login'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: () {
                        if(!_key.currentState.validate()) return;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                            context) => UtilitiesScreen()));

                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
