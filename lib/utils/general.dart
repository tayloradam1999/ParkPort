import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notif.dart';
import '../models/stamp.dart';
import '../models/user.dart';

// References to Firestore collections
final usersRef =
    FirebaseFirestore.instance.collection('users').withConverter<PPUser>(
          fromFirestore: (snapshot, _) {
            return PPUser.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (user, _) => user.toJson(),
        );

final stampsRef =
    FirebaseFirestore.instance.collection('stamps').withConverter<Stamp>(
          fromFirestore: (snapshot, _) {
            return Stamp.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (stamp, _) => stamp.toJson(),
        );

final notifsRef =
    FirebaseFirestore.instance.collection('notifications').withConverter<Notif>(
          fromFirestore: (snapshot, _) {
            return Notif.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (notif, _) => notif.toJson(),
        );

// General functions
Future<PPUser> getUserByID(String userID) async {
  // Get the user from Firebase users collection
  final snapshot = await usersRef.doc(userID).get();
  // Convert data to JSON format
  final user = snapshot.data()!.toJson();
  // Return JSON converted to PPUser object
  return PPUser.fromJson(user);
}
