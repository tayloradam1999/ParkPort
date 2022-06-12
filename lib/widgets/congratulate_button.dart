import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/notifications.dart';
import '../utils/messages.dart';

class CongratulateButton extends StatelessWidget {
  final String otherUser;
  final String notifID;
  const CongratulateButton({Key? key, required this.otherUser, required this.notifID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser = Provider.of<AppState>(context, listen: false).currentUser;

    return Container(
      child: InkWell(
        splashColor: Colors.yellow,
        highlightColor: Colors.blue,
        child: Icon(Icons.celebration, size: 40, color: Colors.green),
        onTap: () {
          congratulateFriend(currentUser, otherUser, notifID);
          congratulateMessage(context);
        },
      ),
    );
  }
}
