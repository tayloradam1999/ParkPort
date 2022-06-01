import 'package:flutter/material.dart';
import '../widgets/submit_button.dart';
import '../widgets/background.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/titlecolor.png",
              width: size.width * 0.75,
              height: size.width * 0.25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CustomSubmitButton(
                label: "SIGN IN",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/SignIn');
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CustomSubmitButton(
                label: "SIGN UP",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/SignUp');
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/ForgotPassword');
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 12, color: Color(0xFF7a8e4d)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
