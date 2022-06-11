import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/notif.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import './notification_item.dart';
import './no_notifications.dart';

class NotificationsStream extends StatelessWidget {
  const NotificationsStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<Notif>>(
        stream: getUsersNotifications(currentUser.userID),
        builder: (BuildContext context, AsyncSnapshot<List<Notif>> snapshot) {
          if (snapshot.hasData && snapshot.data!.length != 0) {
            final notifs = snapshot.data!;
            print(notifs);
            return ListView(
                shrinkWrap: true,
                children: notifs.map(
                  (notif) {
                    // If alerting you of own new stamp, special case
                    return notif.senderID == currentUser.userID
                        ? NotificationItem(
                            name: currentUser.userName,
                            action: 'got_stamp',
                            imgUrl: currentUser.profilePicUrl,
                            userID: currentUser.userID,
                            notif: notif,
                          )
                        // Otherwise, pass notif info to NotificationItem
                        : NotificationItem(
                            name: notif.senderName,
                            action: notif.type,
                            imgUrl: notif.senderPic,
                            userID: notif.senderID,
                            notif: notif,
                          );
                  },
                ).toList());
          } else {
            return NoNotifications();
          }
        });
  }
}
