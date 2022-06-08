
import '../models/user.dart';
import '../providers/auth_state.dart';

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
