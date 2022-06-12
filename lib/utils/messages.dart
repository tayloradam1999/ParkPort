import 'package:flutter/material.dart';
import '../providers/auth_state.dart';

void showAuthMessage(context, Errors msg, String type) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  String text = '';

  // If no errors
  if (msg == Errors.none) {
    if (type == 'signup') {
      text = 'Account created!';
    } else if (type == 'login') {
      text = 'Successfully logged in!';
    }
    scaffold.showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      backgroundColor: Color(0xFF8eb057),
    ));
  }

  // If errors
  else {
    if (msg == Errors.weakError) text = "The password provided is too weak";
    if (msg == Errors.matchError) text = "The provided passwords don't match";
    if (msg == Errors.existsError)
      text = "An account already exists with that email";
    if (msg == Errors.noUserError) text = "No user found for that email";
    if (msg == Errors.wrongError) text = "Incorrect password";
    if (msg == Errors.error && type == 'signup')
      text = "Failed to create account! Please try later";
    if (msg == Errors.error && type == 'login')
      text = "Failed to login! Please try later";
    scaffold.showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      backgroundColor: Color(0xFFe05e4a),
    ));
  }
}

void showMessage(BuildContext context, String text, String type) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(SnackBar(
    content: Text(text, textAlign: TextAlign.center),
    backgroundColor: type == 'green' ? Color(0xFF8eb057) : Color(0xFFe05e4a),
  ));
}
