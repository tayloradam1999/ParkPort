import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../screens/Notifications.dart';
import '../utils/friend_requests.dart';

class DenyRequestButton extends StatefulWidget {
  final String userID;
  const DenyRequestButton({Key? key, required this.userID}) : super(key: key);

  @override
  State<DenyRequestButton> createState() => _DenyRequestButtonState();
}

class _DenyRequestButtonState extends State<DenyRequestButton> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser = Provider.of<AppState>(context, listen: false).currentUser;
    String otherUser = widget.userID;

    return Container(
      child: InkWell(
        splashColor: Colors.red,
        highlightColor: Colors.blue,
        child: Icon(Icons.close_rounded, size: 40, color: Colors.red),
        onTap: () {
          // Update database and show message
          denyFriendRequest(context, currentUser.userID, otherUser);
          // Update current user state
          setState(() {
            currentUser.friendNotifs.remove(otherUser);
          });
          // Force rebuild - fallback option on how to do this
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notifications()),
          );
        },
      ),
    );
  }
}
