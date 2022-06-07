import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../models/stamp.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';
import './messages.dart';

// Create reference to Firestore database users collection
final stampsRef =
    FirebaseFirestore.instance.collection('stamps').withConverter<Stamp>(
          fromFirestore: (snapshot, _) {
            return Stamp.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (user, _) => user.toJson(),
        );

Future<void> addStampToUser(context, userID, stampID) async {
  // Update user's stamps list and notifications in Firestore
  AuthState().usersRef.doc(userID).update({
    'collectedStampList': FieldValue.arrayUnion([stampID]),
    'stampNotifs': FieldValue.arrayUnion([userID])
  });
  PPUser currentUser =
      Provider.of<AppState>(context, listen: false).currentUser;
  // Update stampNotifs for all friends in Firestore friendList
  for (String friendID in currentUser.friendList) {
    AuthState().usersRef.doc(friendID).update({
      'stampNotifs': FieldValue.arrayUnion([userID])
    });
  }
  // Update user's stamps list in AppState
  currentUser.collectedStampList.add(stampID);
  // Display toast message
  addStampMessage(context);
}

Stream<List<Stamp>>? getAllStamps() {
  return stampsRef.snapshots()
  .map((snapshot) =>
      snapshot.docs.map((doc) => Stamp.fromJson(doc.data().toJson())).toList());
}

bool userHasStamp(currentUser, stampID) {
  return currentUser.collectedStampList.contains(stampID);
}

// Stream<List<Stamp>>? getCollectedStamps(PPUser currentUser, String stampID) {
//   return stampsRef
//   .where(currentUser.collectedStampList, arrayContains: stampID)
//   .snapshots()
//   .map((snapshot) =>
//       snapshot.docs.map((doc) => Stamp.fromJson(doc.data().toJson())).toList());
// }
