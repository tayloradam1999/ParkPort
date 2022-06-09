import 'package:flutter/material.dart';
import '../providers/auth_state.dart';
import '../utils/messages.dart';
import './SignIn.dart';
import '../widgets/background_without_icon.dart';

class SignUp extends StatefulWidget {
  // Stateful widget with no parameters passed in
  const SignUp({Key? key}) : super(key: key);

  @override
  // Create stateful widget including build context
  // Not mounted yet - just calls build with state encapsulated
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Define property types
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;

  @override
  void initState() {
    // Initializes state and mounts - data, properties
    // Subscribes to state changes
    super.initState();
    // set controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    // Permanently remove everything at end of lifecycle (after unmount)
    // dispose controllers
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    // dispose state
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Renders page - called when updated
    // Rebuilds widget when state (name, email, password, confirm) changes with updated values

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: BackgroundWithoutIcon(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "REGISTER",
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
                    controller: _nameController,
                    cursorColor: Color(0xFF8eb057),
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Color(0xFF8eb057),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7a8e4d), width: 2),
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xFF8eb057),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _emailController,
                    cursorColor: Color(0xFF8eb057),
                    decoration: InputDecoration(
                      labelText: "Email",
                      fillColor: Color(0xFF8eb057),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7a8e4d), width: 2),
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xFF8eb057),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _passwordController,
                    cursorColor: Color(0xFF8eb057),
                    decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: Color(0xFF7a8e4d),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7a8e4d), width: 2),
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xFF8eb057),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _confirmController,
                    cursorColor: Color(0xFF8eb057),
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                      fillColor: Color(0xFF7a8e4d),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF7a8e4d), width: 2),
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xFF7a8e4d),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: RaisedButton(
                    onPressed: () async {
                      // Pass information to authentication provider
                      Errors msg = await AuthState().attemptSignUp(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _confirmController.text);
                      // Return message based on Errors return
                      // If successful, navigate to signin screen
                      if (msg == Errors.none) {
                        showMessage(context, msg, 'signup');
                        Navigator.pushReplacementNamed(context, '/SignIn');
                      } else {
                        showMessage(context, msg, 'signup');
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.51,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(
                              colors: [Color(0xFFe05e4a), Color(0xFFe7b732)])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()))
                    },
                    child: Text(
                      "Already Have an Account?\nSign in",
                      style: TextStyle(fontSize: 13, color: Color(0xFF7a8e4d)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
