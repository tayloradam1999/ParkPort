import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

Future<String> pickImage(BuildContext context, String type) async {
  final Storage storage = Storage();
  late var image;
  try {
    // Get image path from camera whether from gallery or camera (using phone's internal path)
    if (type == 'camera') {
      image = await ImagePicker().pickImage(
          source: ImageSource.camera, maxHeight: 150, imageQuality: 75);
    } else {
      image = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 150, imageQuality: 75);
    }
    // Get image path and pass to storage to upload/retrieve with Firebase
    String url = await storage.uploadImageFile(context, image.path);
    return url;
  } catch (e) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text('Error uploading file!', textAlign: TextAlign.center),
      backgroundColor: Color(0xFFe05e4a),
    ));
    return '';
  }
}

class Storage {
  // Get reference to Firebase Storage
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadImageFile(BuildContext context, filePath) async {
    final scaffold = ScaffoldMessenger.of(context);
    // Create file reference from path
    File file = File(filePath);
    // File name will be user email so user only has one profile picture
    String? email = FirebaseAuth.instance.currentUser!.email;
    try {
      // Upload file to Firebase Storage
      await storage.ref('file/$email').putFile(file);
      // After successful upload, retrieve file url (return url to caller)
      return getImageUrl();
    } on firebase_core.FirebaseException catch (e) {
      scaffold.showSnackBar(SnackBar(
        content: Text('Error uploading file!', textAlign: TextAlign.center),
        backgroundColor: Color(0xFFe05e4a),
      ));
      return '';
    }
  }

  Future<String> getImageUrl() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    String userID = FirebaseAuth.instance.currentUser!.uid;
    // Get reference to image in Firebase Storage (for each user, file name is email)
    final url = await storage.ref('file/$email').getDownloadURL();
    // Update user profile in Firebase Firestore
    await FirebaseFirestore.instance.collection('users').doc(userID).update({
      'profilePicUrl': url,
    });
    // Begin to pass url back to caller pickImage
    return url;
  }
}
