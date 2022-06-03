import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../utils/friend_requests.dart';

class DenyRequestButton extends StatelessWidget {
  final String userID;
  const DenyRequestButton({Key? key, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUser = Provider.of<AppState>(context).currentUser.userID;

    return Container(
      child: InkWell(
        splashColor: Colors.red,
        highlightColor: Colors.blue,
        child: Icon(Icons.close_rounded, size: 40, color: Colors.red),
        onTap: () {
          denyFriendRequest(currentUser, userID);
        },
      ),
    );
  }
}
