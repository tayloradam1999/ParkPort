import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    String currentUser = Provider.of<AppState>(context).currentUser.userID;

    return Container(
      child: InkWell(
        splashColor: Colors.green,
        highlightColor: Colors.blue,
        child: Icon(Icons.check_circle_outline, size: 40, color: Colors.green),
        onTap: () {
          acceptFriendRequest(currentUser, widget.userID);
          setState(() {});
        },
      ),
    );
  }
}
