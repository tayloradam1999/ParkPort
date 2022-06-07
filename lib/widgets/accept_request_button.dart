import 'package:flutter/material.dart';
import 'package:park_port/screens/Notifications.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/friend_requests.dart';

class AcceptRequestButton extends StatefulWidget {
  final String userID;
  const AcceptRequestButton({Key? key, required this.userID}) : super(key: key);

  @override
  State<AcceptRequestButton> createState() => _AcceptRequestButtonState();
}

class _AcceptRequestButtonState extends State<AcceptRequestButton> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser = Provider.of<AppState>(context, listen: false).currentUser;
    String otherUser = widget.userID;

    return Container(
      child: InkWell(
        splashColor: Colors.green,
        highlightColor: Colors.blue,
        child: Icon(Icons.check_circle_outline, size: 40, color: Colors.green),
        onTap: () {
          acceptFriendRequest(context, currentUser.userID, otherUser);
          // Update provider state
          setState(() {
            currentUser.friendList.add(otherUser);
            currentUser.friendNotifs.remove(otherUser);
          });
          // Whatever - force rerender
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notifications()),
          );
        },
      ),
    );
  }
}
