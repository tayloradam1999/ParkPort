import '../models/user.dart';

bool isFriend(PPUser currentUser, String userID) {
  if (currentUser.friendList.contains(userID)) {
    return true;
  } else {
    return false;
  }
}

bool isPendingFriend(PPUser otherUser, String currentUserID) {
  if (otherUser.friendNotifs.contains(currentUserID)) {
    return true;
  } else {
    return false;
  }
}
