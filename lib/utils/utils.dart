import '../models/user.dart';

String whatTypeOfUser(PPUser currentUser, PPUser otherUser) {
  if (currentUser.userID == otherUser.userID) {
    return 'self';
  } else if (currentUser.friendList.contains(otherUser.userID)) {
    return 'friend';
  } else {
    return otherUser.friendNotifs.contains(currentUser.userID) ? 'pending' : 'other';
  }
}
