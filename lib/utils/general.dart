import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notif.dart';
import '../models/stamp.dart';

// Create reference to Firestore database stamps collection
final stampsRef =
    FirebaseFirestore.instance.collection('stamps').withConverter<Stamp>(
          fromFirestore: (snapshot, _) {
            return Stamp.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (stamp, _) => stamp.toJson(),
        );

// Create reference to Firestore database notifications collection
final notifsRef =
    FirebaseFirestore.instance.collection('notifications').withConverter<Notif>(
          fromFirestore: (snapshot, _) {
            return Notif.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (notif, _) => notif.toJson(),
        );
