import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/notif.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import './notification_item.dart';
import './no_notifications.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;
    print(currentUser);
    return StreamBuilder<List<Notif>>(
        stream: getUsersNotifications(currentUser),
        builder: (BuildContext context, AsyncSnapshot<List<Notif>> snapshot) {
          if (snapshot.hasData && snapshot.data!.length > 0) {
            final notifs = snapshot.data!;
            return ListView(
                shrinkWrap: true,
                children: notifs.map(
                  (notif) {
                    return currentUser.userID == notif.senderID
                        ? NotificationItem(
                            name: currentUser.userName,
                            action: 'got_stamp',
                            imgUrl: currentUser.profilePicUrl,
                            userID: currentUser.userID,
                            notifID: notif.notifID,
                          )
                        : NotificationItem(
                            name: notif.senderName,
                            action: notif.type,
                            imgUrl: notif.senderPic,
                            userID: notif.senderID,
                            notifID: notif.notifID,
                          );
                  },
                ).toList());
          } else {
            return NoNotifications();
          }
        });
  }
}
