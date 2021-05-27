import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset("images/logo.png"),
                    height: 60,
                  ),
                ),
                Text(
                  "Flash Chat",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 5,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200,
                  height: 42,
                  child: Text("Log In"),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                  elevation: 5,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    minWidth: 200,
                    height: 42,
                    child: Text(
                      "Register",
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
