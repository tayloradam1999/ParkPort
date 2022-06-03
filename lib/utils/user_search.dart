import '../providers/auth_state.dart';
import '../models/user.dart';

Stream<List<PPUser>>? getMatchingUsers(
    context, String userName, PPUser currentUser) {
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
