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
          toFirestore: (stamp, _) => stamp.toJson(),
        );

Future<void> addStampToUser(context, userID, stampID) async {
  // Update user's stamps list and notifications in Firestore
  AuthState().usersRef.doc(userID).update({
    'collectedStampList': FieldValue.arrayUnion([stampID]),
    'stampNotifs': FieldValue.arrayUnion([userID]),
    'points': FieldValue.increment(10)
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
  return stampsRef.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Stamp.fromJson(doc.data().toJson())).toList());
}

bool userHasStamp(currentUser, stampID) {
  return currentUser.collectedStampList.contains(stampID);
}

Future<List<PPUser>> getInfoAboutNewStamp(PPUser currentUser) async {
  List<PPUser> friendInfo = [];
  final List<String> stampNotifs = currentUser.stampNotifs;
  for (int i = 0; i < stampNotifs.length; i++) {
    // For every ID in friendRequests, get the user's info and add to friendInfo list
    final userID = stampNotifs[i];
    if (currentUser.stampNotifs.contains(userID)) {
      final users = await AuthState().getUserByID(userID);
      friendInfo.add(users);
    }
  }
  return friendInfo;
}
