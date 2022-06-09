import 'package:flutter/material.dart';
import '../providers/auth_state.dart';

void showMessage(context, Errors msg, String type) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  String text = '';

  // If no errors
  if (msg == Errors.none && type == 'signup') {
    scaffold.showSnackBar(const SnackBar(
      content: Text("Account created!", textAlign: TextAlign.center),
      backgroundColor: Color(0xFF8eb057),
    ));
  } else if (msg == Errors.none && type == 'login') {
    scaffold.showSnackBar(const SnackBar(
      content: Text("Logged in successfully!", textAlign: TextAlign.center),
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

void sendResetPassword(context) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  // Display snackbar
  scaffold.showSnackBar(const SnackBar(
    content: Text("Check your email to reset your password!", textAlign: TextAlign.center),
    backgroundColor: Color(0xFF8eb057),
  ));
}

void acceptFriendMessage(context) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  // Display snackbar
  scaffold.showSnackBar(const SnackBar(
    content: Text("You have a new friend!", textAlign: TextAlign.center),
    backgroundColor: Color(0xFF8eb057),
  ));
}

void denyFriendMessage(context) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  // Display snackbar
  scaffold.showSnackBar(const SnackBar(
    content: Text("Friend request removed", textAlign: TextAlign.center),
    backgroundColor: Color(0xFFe05e4a),
  ));
}

void addStampMessage(context) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  // Display snackbar
  scaffold.showSnackBar(const SnackBar(
    content: Text("You have a new stamp!", textAlign: TextAlign.center),
    backgroundColor: Color(0xFF8eb057),
  ));
}

void congratulateMessage(context) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  // Display snackbar
  scaffold.showSnackBar(const SnackBar(
    content: Text("You're a good friend!", textAlign: TextAlign.center),
    backgroundColor: Color(0xFF8eb057),
  ));
}

void ignoreNotificationMessage(context) {
  // Tap into scaffold to show snackbar
  final scaffold = ScaffoldMessenger.of(context);
  // Display snackbar
  scaffold.showSnackBar(const SnackBar(
    content: Text("Message dismissed", textAlign: TextAlign.center),
    backgroundColor: Color(0xFFe05e4a),
  ));
}
