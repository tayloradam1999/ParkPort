import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';

class Storage {
  // Get reference to Firebase Storage
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadImageFile(context, String filePath) async {
    final scaffold = ScaffoldMessenger.of(context);
    // Create file reference from path
    File file = File(filePath);
    // File name will be user email so user only has one profile picture
    String? email = FirebaseAuth.instance.currentUser!.email;
    try {
      // Upload file to Firebase Storage
      await storage.ref('file/$email').putFile(file);
      // After successful upload, retrieve file url
      getImageUrl();
    } on firebase_core.FirebaseException catch (e) {
      scaffold.showSnackBar(SnackBar(
      content: Text('Error uploading file!', textAlign: TextAlign.center),
      backgroundColor: Color(0xFFe05e4a),
    ));
    }
  }

  Future<void> getImageUrl() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    String userID = FirebaseAuth.instance.currentUser!.uid;
    // Get reference to image in Firebase Storage (for each user, file name is email)
    final url = await storage.ref('file/$email').getDownloadURL();
    // Update user profile in Firebase Firestore
    await FirebaseFirestore.instance.collection('users').doc(userID).update({
      'profilePicUrl': url,
    });
  }
}
