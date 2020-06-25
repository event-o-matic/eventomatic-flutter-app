import 'package:eventomatic/base/base_view_model.dart';
import 'package:eventomatic/utilities_screen.dart';
import 'package:eventomatic/utils/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_view_model.dart';
import 'validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();

  final TextStyle _textStyle = TextStyle(
    color: ThemeColors.primary,
  );

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        key: loginScaffoldKey,
        appBar: AppBar(
        title: Text("Eventomatic"),
        backgroundColor: ThemeColors.primary,
        ),
      backgroundColor: Colors.white,
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
//                      focusColor: ThemeColors.primary,
                      fillColor: Colors.white,
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(

                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Password',
                      labelStyle: _textStyle,
                    ),
                  ),
                ),

                Container(
                  height: 100,
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: authModel.state == ViewState.loading ? Center(child: CircularProgressIndicator()) : RaisedButton(
                    textColor: Colors.white,
                    color: ThemeColors.orange,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () async {
                      if (!_key.currentState.validate()) return;
                      await authModel.logIn(
                          emailController.text, passwordController.text);
                      if (authModel.hasError) {
                        showError(loginScaffoldKey.currentState, authModel.error);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UtilitiesScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget showError(ScaffoldState scaffoldState, String errorMessage, {Widget child}) {
  if (scaffoldState != null) {
    scaffoldState.hideCurrentSnackBar();
    scaffoldState.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(errorMessage),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            // Navigator.pop(scaffoldState);
          },
        ),
      ),
    );
  }
  return child ?? Container();
}
