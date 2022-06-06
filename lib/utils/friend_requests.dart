import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/auth_state.dart';
import '../models/user.dart';

Stream<List<PPUser>>? getMatchingUsers(String userName, PPUser currentUser) {
  if (userName != '') {
    return AuthState()
        .usersRef
        .where('lowercaseName', isNotEqualTo: currentUser.lowercaseName)
        // This allows for partial strings
        // Any string between actual userName and the username plus last character possible
        .where('lowercaseName', isGreaterThanOrEqualTo: userName)
        .where('lowercaseName', isLessThanOrEqualTo: userName + '\uf8ff')
        // Only want 10 results max
        .limit(10)
        // Get snapshot of every piece of data from Firestore that matches the query
        .snapshots()
        // For each document in snapshot, convert to PPUser and return list
        .map((snapshot) => snapshot.docs
            .map((doc) => PPUser.fromJson(doc.data().toJson()))
            .toList());
  } else {
    return null;
  }
}

Future<void> sendFriendRequest(String currentUser, String userID) async {
  // Create reference to Firestore database users collection
  final usersRef = FirebaseFirestore.instance.collection('users');

  // Get current user's friendRequests list
  await usersRef.doc(userID).update({
    'friendNotifs': FieldValue.arrayUnion([currentUser])
  });
}

Future<List<PPUser>> getInfoAboutFriendRequests(PPUser currentUser) async {
  List<PPUser> friendInfo = [];
  final List<String> friendRequests = currentUser.friendNotifs;
  for (int i = 0; i < friendRequests.length; i++) {
    // For every ID in friendRequests, get the user's info and add to friendInfo list
    final userID = friendRequests[i];
    final users = await AuthState().getUserByID(userID);
    friendInfo.add(users);
  }
  return friendInfo;
}

acceptFriendRequest(String currentUser, String userID) async {
  // Create reference to Firestore database users collection
  final usersRef = FirebaseFirestore.instance.collection('users');

  // Update current user's friendList and remove the notification
  await usersRef.doc(currentUser).update({
    'friendNotifs': FieldValue.arrayRemove([userID]),
    'friendList': FieldValue.arrayUnion([userID])
  });
  // Add current user to the other user's friendList
  await usersRef.doc(userID).update({
    'friendList': FieldValue.arrayUnion([currentUser])
  });
}

denyFriendRequest(currentUser, userID) async{
  await FirebaseFirestore.instance.collection('users').doc(currentUser).update({
    'friendNotifs': FieldValue.arrayRemove([userID]),
  });
}