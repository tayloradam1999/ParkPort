import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_port/widgets/background.dart';
import '../providers/auth_state.dart';
import '../utils/messages.dart';
import '../widgets/background_without_icon.dart';
import '../widgets/submit_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _emailController;

  @override
  void initState() {
    // init state
    super.initState();
    // set controllers
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // dispose controllers
    _emailController.dispose();
    // dispose state
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: size.height < 750
          ? BackgroundWithoutIcon(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8eb057),
                              fontSize: 32),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Enter your email address and we will send you a link to reset your password.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: GoogleFonts.mulish().fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
                              borderSide: BorderSide(color: Color(0xFF8eb057)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF8eb057),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: CustomSubmitButton(
                          label: 'Submit',
                          onPressed: () async {
                            AuthState().resetPassword(_emailController.text);
                            sendResetPassword(context);
                            Navigator.pushNamed(context, '/SignIn');
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/SignIn');
                              },
                              child: Text(
                                'Go Back',
                                style: TextStyle(
                                  color: Color(0xFF7a8e4d),
                                  fontFamily: GoogleFonts.mulish().fontFamily,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Background(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8eb057),
                              fontSize: 32),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Enter your email address and we will send you a link to reset your password.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: GoogleFonts.mulish().fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
                              borderSide: BorderSide(color: Color(0xFF8eb057)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF8eb057),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: CustomSubmitButton(
                          label: 'Submit',
                          onPressed: () async {
                            AuthState().resetPassword(_emailController.text);
                            sendResetPassword(context);
                            Navigator.pushNamed(context, '/SignIn');
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/SignIn');
                              },
                              child: Text(
                                'Go Back',
                                style: TextStyle(
                                  color: Color(0xFF7a8e4d),
                                  fontFamily: GoogleFonts.mulish().fontFamily,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
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
