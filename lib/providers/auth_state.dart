import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:park_port/providers/app_state.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../utils/general.dart';

// Define Errors type coming back from Firebase used in Future<Errors> etc
enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  wrongError,
  noUserError,
  error,
}

class AuthState extends ChangeNotifier {
  // Initialize FirebaseAuth with instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Errors handleException(e) {
    // Depending on Errors code from Firebase, return Errors type
    Errors _status;
    switch (e.code) {
      case "weak-password":
        _status = Errors.weakError;
        break;
      case "email-already-in-use":
        _status = Errors.existsError;
        break;
      case "user-not-found":
        _status = Errors.noUserError;
        break;
      case "wrong-password":
        _status = Errors.wrongError;
        break;
      default:
        _status = Errors.error;
        break;
    }
    return _status;
  }

  Future<Errors> attemptSignUp(String name, String email, String password,
      String passwordConfirmation) async {
    Errors _status = Errors.none;
    // Manual check to make sure passwords match since Firebase doesn't do this
    if (password != passwordConfirmation) {
      return Errors.matchError;
    }
    try {
      // This adds user to Firebase Authentication
      UserCredential userCredentials =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If successfully return User, get value
      User? signedInUser = userCredentials.user;
      if (signedInUser != null) {
        // This adds user to users collection by converting values into Map<String, dynamic> used by Firestore
        await usersRef.doc(signedInUser.uid).set(PPUser.fromJson({
              'userID': signedInUser.uid,
              'email': signedInUser.email,
              'userName': name,
              'lowercaseName': name.toLowerCase(),
              'status': 'Excited for ParkPort!',
              'location': 'Tulsa, OK',
              'profilePicUrl': 'https://i.postimg.cc/nV3fQKp5/PP-logo.png',
              'dateJoined': DateTime.now(),
              'points': 0,
              'friendList': [],
              'friendNotifs': [],
              'collectedStampList': [],
              'stampNotifs': [],
              'notifs': [],
            }));
      }
    } on FirebaseAuthException catch (e) {
      _status = handleException(e);
    }
    return _status;
  }

  Future<Errors> attemptLogin(String email, String password) async {
    Errors _status = Errors.none;
    try {
      // This signs user into Firebase Authentication
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _status = (handleException(e));
    }
    return _status;
  }

  void logout() {
    // This signs user out of Firebase Authentication
    _auth.signOut();
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<PPUser> getCurrentUserModel() async {
    // Get the user from Firebase users collection
    final snapshot = await usersRef.doc(_auth.currentUser!.uid).get();
    // Convert data to JSON format
    final user = snapshot.data()?.toJson();
    // Convert JSON to PPUser - there is no way to convert from Firestore snapshot to PPUser directly
    return PPUser.fromJson(user!);
  }
}
