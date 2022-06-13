import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/notifications.dart';
import '../utils/messages.dart';

class AcceptRequestButton extends StatefulWidget {
  final String otherUser;
  final String notifID;
  const AcceptRequestButton({Key? key, required this.otherUser, required this.notifID}) : super(key: key);

  @override
  State<AcceptRequestButton> createState() => _AcceptRequestButtonState();
}

class _AcceptRequestButtonState extends State<AcceptRequestButton> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser = Provider.of<AppState>(context, listen: false).currentUser;

    return Container(
      child: InkWell(
        splashColor: Colors.green,
        highlightColor: Colors.blue,
        child: Icon(Icons.check_circle_outline, size: 40, color: Colors.green),
        onTap: () {
          acceptFriendRequest(currentUser.userID, widget.otherUser, widget.notifID);
          showMessage(context, 'You have a new friend!', 'green');
          setState(() {
            currentUser.friendList.add(widget.otherUser);
          });
        },
      ),
    );
  }
}
