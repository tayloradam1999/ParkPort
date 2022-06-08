import 'package:flutter/material.dart';
import 'package:park_port/widgets/background_without_icon.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';
import '../screens/Home.dart';
import '../widgets/background.dart';
import '../utils/messages.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Define property types
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // Initializes state and mounts - data, properties
    // Subscribes to state changes
    super.initState();
    // set controllers
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // dispose controllers
    _emailController.dispose();
    _passwordController.dispose();
    // dispose state
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWithoutIcon(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Text(
                "SIGN IN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8eb057),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                cursorColor: Color(0xFF8eb057),
                decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Color(0xFFf2f2f2),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7a8e4d), width: 2),
                  ),
                  labelStyle: TextStyle(color: Color(0xFF8eb057)),
                ),
                controller: _emailController,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                cursorColor: Color(0xFF8eb057),
                decoration: InputDecoration(
                  labelText: "Password",
                  fillColor: Color(0xFF8eb057),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7a8e4d), width: 2),
                  ),
                  labelStyle: TextStyle(color: Color(0xFF8eb057)),
                ),
                controller: _passwordController,
                obscureText: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/ForgotPassword');
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 15, color: Color(0xFF7a8e4d)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: RaisedButton(
                // What is this???
                // Answer: button.
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  onTap: () async {
                    Errors msg = await AuthState().attemptLogin(
                        _emailController.text, _passwordController.text);
                    if (msg == Errors.none) {
                      showMessage(context, msg, 'login');
                      Provider.of<AppState>(context, listen: false)
                          .setpageIndex = 0;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      showMessage(context, msg, 'login');
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width * 0.575,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color(0xFFe05e4a),
                          Color(0xFFe7b732),
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  print(size.height),
                  Navigator.pushReplacementNamed(context, '/SignUp')
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(fontSize: 13, color: Color(0xFF7a8e4d)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
