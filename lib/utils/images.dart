import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../storage/storage_service.dart';

Future<void> pickImageFromDevice(context) async {
  final scaffold = ScaffoldMessenger.of(context);
  final Storage storage = Storage();
  
  // Allow user to pick one image from their device of specified types
  final results = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png', 'jpeg'],
  );
  // If clicks out without selecting an image, show message
  if (results == null) {
      scaffold.showSnackBar(SnackBar(
      content: Text('No image selected', textAlign: TextAlign.center),
      backgroundColor: Color(0xFFe05e4a),
    ));

  }
  // If image selected, get path and pass to storage to upload/retrieve with Firebase
  final path = results!.files.single.path;
  await storage.uploadImageFile(context, path!);
  // After successful upload, show snackbar
  scaffold.showSnackBar(SnackBar(
      content: Text('Image uploaded successfully!', textAlign: TextAlign.center),
      backgroundColor: Color(0xFF8eb057),
    ));
}
