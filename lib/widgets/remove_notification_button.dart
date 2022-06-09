import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../utils/messages.dart';
import '../utils/notifications.dart';

class RemoveNotification extends StatelessWidget {
  final String notifID;
  final String type;
  const RemoveNotification({Key? key, required this.notifID, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUser =
        Provider.of<AppState>(context, listen: false).currentUser.userID;
    print("NOTFIID: $notifID");


    return Container(
      child: InkWell(
        splashColor: Colors.yellow,
        highlightColor: Colors.blue,
        child: Icon(Icons.close_rounded, size: 40, color: Colors.red),
        onTap: () {
          // Update database and show message
          ignoreNotification(currentUser, notifID, type);
          ignoreNotificationMessage(context);
        },
      ),
    );
  }
}
