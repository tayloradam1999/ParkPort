import '../models/notif.dart';
import '../models/stamp.dart';
import '../models/user.dart';
import './general.dart';

Stream<List<PPUser>>? getAllMatchingUsers(
    context, String userName, PPUser currentUser) {
  return usersRef
      .where('lowercaseName', isNotEqualTo: currentUser.lowercaseName)
      // This allows for partial strings
      // Any string between actual userName and the username plus last character possible
      .where('lowercaseName', isGreaterThanOrEqualTo: userName)
      .where('lowercaseName', isLessThanOrEqualTo: userName + '\uf8ff')
      // Get snapshot of every piece of data from Firestore that matches the query
      .snapshots()
      // For each document in snapshot, convert to PPUser and return list
      .map((snapshot) => snapshot.docs
          .map((doc) => PPUser.fromJson(doc.data().toJson()))
          .toList());
}

Stream<List<PPUser>>? get10MatchingUsers(String userName, PPUser currentUser) {
  if (userName != '') {
    return usersRef
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

Stream<List<Notif>> getUsersNotifications(String currentUser) {
  return notifsRef
      .where('recipientList', arrayContains: currentUser)
      // Attempt to sort in chronological order
      // .orderBy('notifSent', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Notif.fromJson(doc.data().toJson()))
          .toList());
}

Stream<List<PPUser>> getTop10Users() {
  return usersRef
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

Stream<List<PPUser>> getTopFriends() {
  return usersRef
      // Only want 10 results max
      .orderBy('points', descending: true)
      // Get snapshot of every piece of data from Firestore that matches the query
      .snapshots()
      // For each document in snapshot, convert to PPUser and return list
      .map((snapshot) => snapshot.docs
          .map((doc) => PPUser.fromJson(doc.data().toJson()))
          .toList());
}
