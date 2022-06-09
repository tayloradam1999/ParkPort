import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../models/notif.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';
import '../utils/general.dart';
import './general.dart';

Future<void> sendFriendRequest(PPUser currentUser, String userID) async {
  // Create notification object
  Notif notification = Notif(
    notifID: '',
    type: 'friend_request',
    senderID: currentUser.userID,
    senderName: currentUser.userName,
    senderPic: currentUser.profilePicUrl,
    recipientList: [userID],
  );
  // Add to notifications collection and get reference to it
  String notifID = await FirebaseFirestore.instance
      .collection('notifications')
      .add(notification.toJson())
      .then((docRef) => docRef.id);
  // Add notification to other user's notification list
  await AuthState().usersRef.doc(userID).update({
    'notifs': FieldValue.arrayUnion([notifID]),
  });
  // Couldn't assign ID before added to Firestore but go back and update now
  await notifsRef.doc(notifID).update({
    'notifID': notifID,
  });
}

Future<void> acceptFriendRequest(context, String currentUser, String userID, String notifID) async {
  // Create reference to Firestore database users collection
  final usersRef = FirebaseFirestore.instance.collection('users');
  // Update current user's friendList and remove the notification
  await usersRef.doc(currentUser).update({
    'notifs': FieldValue.arrayRemove([userID]),
    'friendList': FieldValue.arrayUnion([userID]),
    'points': FieldValue.increment(10)
  });
  // Add current user to the other user's friendList
  await usersRef.doc(userID).update({
    'friendList': FieldValue.arrayUnion([currentUser]),
    'points': FieldValue.increment(10)
  });
  Provider.of<AppState>(context, listen: false).currentUser.friendList.add(userID);
  // Only ever one friend_request recipient so delete entire document once dealt with
  // await FirebaseFirestore.instance.collection('notifications').doc(notifID).delete();
}

Future<void> ignoreFriendNotification(String currentUser, String notifID) async {
  // Remove userID from currentUser's friendNotifs
  await FirebaseFirestore.instance.collection('users').doc(currentUser).update({
    'notifs': FieldValue.arrayRemove([notifID]),
  });
  await FirebaseFirestore.instance.collection('notifications').doc(notifID).update({
    'recipientList': FieldValue.arrayRemove([currentUser]),
  });
}

Future<void> ignoreNotification(String currentUser, String notifID, String type) async {
  // Remove userID from currentUser's friendNotifs
  await FirebaseFirestore.instance.collection('users').doc(currentUser).update({
    'notifs': FieldValue.arrayRemove([notifID]),
  });
  await FirebaseFirestore.instance.collection('notifications').doc(notifID).update({
    'recipientList': FieldValue.arrayRemove([currentUser]),
  });
}

Future<void> addStampToUser(context, PPUser currentUser, String stampID) async {
  Notif notification = Notif(
    notifID: '',
    type: 'got_stamp',
    senderID: currentUser.userID,
    senderName: currentUser.userName,
    senderPic: currentUser.profilePicUrl,
    recipientList: [...currentUser.friendList, currentUser.userID],
    otherInfo: stampID,
  );
  // Add to notifications collection and get reference to it
  String notifID = await FirebaseFirestore.instance
      .collection('notifications')
      .add(notification.toJson())
      .then((docRef) => docRef.id);
  // Couldn't assign ID before added to Firestore but go back and update now
  await notifsRef.doc(notifID).update({
    'notifID': notifID,
  });
  // Update user's stamps list and notifications in Firestore
  AuthState().usersRef.doc(currentUser.userID).update({
    'collectedStampList': FieldValue.arrayUnion([stampID]),
    'notifs': FieldValue.arrayUnion([notifID]),
    'points': FieldValue.increment(10)
  });
  // Update currentUser in AppState
  Provider.of<AppState>(context, listen: false).currentUser.points += 10;
  Provider.of<AppState>(context, listen: false).currentUser.collectedStampList.add(stampID);
  // Send notification to friends also
  for (String friendID in currentUser.friendList) {
    AuthState().usersRef.doc(friendID).update({
      'notifs': FieldValue.arrayUnion([notifID])
    });
  }
}

Future<void> congratulateFriend(PPUser currentUser, String userID, String existingNotifID) async {
  // Create notification object
  Notif notification = Notif(
    notifID: '',
    type: 'send_congrats',
    senderID: currentUser.userID,
    senderName: currentUser.userName,
    senderPic: currentUser.profilePicUrl,
    recipientList: [userID],
  );
  // Add to notifications collection and get reference to it
  String newNotifID = await FirebaseFirestore.instance
      .collection('notifications')
      .add(notification.toJson())
      .then((docRef) => docRef.id);
  // Update send_congrats notification in Firestore
  await notifsRef.doc(newNotifID).update({
    'notifID': FieldValue.arrayUnion([newNotifID])
  });
  // Add send_congrats notification to other user's notification list
  await AuthState().usersRef.doc(userID).update({
    'notifs': FieldValue.arrayUnion([newNotifID]),
  });
  // Remove got_stamp notification  from current user's notification list
  await AuthState().usersRef.doc(currentUser.userID).update({
    'notifs': FieldValue.arrayRemove([existingNotifID]),
  });
  // Remove current user from got_stamp notification list
  await notifsRef.doc(existingNotifID).update({
    'recipientList': FieldValue.arrayRemove([currentUser.userID]),
  });
}
