import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../utils/notifications.dart';
import '../utils/messages.dart';

class AcceptRequestButton extends StatelessWidget {
  final String otherUser;
  final String notifID;
  const AcceptRequestButton({Key? key, required this.otherUser, required this.notifID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUser = Provider.of<AppState>(context, listen: false).currentUser.userID;

    return Container(
      child: InkWell(
        splashColor: Colors.green,
        highlightColor: Colors.blue,
        child: Icon(Icons.check_circle_outline, size: 40, color: Colors.green),
        onTap: () {
          acceptFriendRequest(currentUser, otherUser, notifID);
          acceptFriendMessage(context);
          // Update provider state
          // setState(() {
          //   currentUser.friendList.add(otherUser);
          //   currentUser.notifs.remove(otherUser);
          // });
          // // Whatever - force rerender
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const Notifications()),
          // );
        },
      ),
    );
  }
}
