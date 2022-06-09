import '../providers/auth_state.dart';
import '../models/notif.dart';
import '../models/stamp.dart';
import '../models/user.dart';
import './general.dart';

Stream<List<PPUser>>? getAllUsers(
    context, String userName, PPUser currentUser) {
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
}

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

Stream<List<Stamp>>? getAllStamps() {
  return stampsRef.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Stamp.fromJson(doc.data().toJson())).toList());
}

Stream<List<Notif>>? getUsersNotifications(PPUser currentUser) {
  return notifsRef
  .where('recipientList', arrayContains: currentUser.userID)
  .snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Notif.fromJson(doc.data().toJson())).toList());
}

Stream<List<PPUser>>? getTop10Users() {
  return AuthState()
      .usersRef
      // Only want 10 results max
      .limit(10)
      .orderBy('points', descending: true)
      // Get snapshot of every piece of data from Firestore that matches the query
      .snapshots()
      // For each document in snapshot, convert to PPUser and return list
      .map((snapshot) => snapshot.docs
          .map((doc) => PPUser.fromJson(doc.data().toJson()))
          .toList());
}
