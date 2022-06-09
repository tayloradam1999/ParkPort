import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../utils/notifications.dart';
import '../utils/messages.dart';

class DenyRequestButton extends StatelessWidget {
  final String notifID;
  const DenyRequestButton({Key? key, required this.notifID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUser =
        Provider.of<AppState>(context, listen: false).currentUser.userID;

    return Container(
      child: InkWell(
        splashColor: Colors.red,
        highlightColor: Colors.blue,
        child: Icon(Icons.close_rounded, size: 40, color: Colors.red),
        onTap: () {
          // Update database and show message
          ignoreFriendNotification(currentUser, notifID);
          denyFriendMessage(context);
        },
      ),
    );
  }
}
