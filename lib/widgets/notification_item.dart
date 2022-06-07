import 'package:flutter/material.dart';
import '../screens/Notifications.dart';
import './accept_request_button.dart';
import './deny_request_button.dart';

class NotificationItem extends StatefulWidget {
  final String name;
  final String imgUrl;
  final String action;
  final String userID;

  NotificationItem({
    Key? key,
    required this.name,
    required this.imgUrl,
    required this.action,
    required this.userID,
  }) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    String userID = widget.userID;

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.imgUrl),
              minRadius: 25,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 7.5),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFe05e4a),
                    ),
                  ),
                ),
                if (widget.action == 'friend_request')
                  Text(
                    'Sent you a friend request',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (widget.action == 'got_stamp')
                  Text(
                    'Got a stamp',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          // if action is friend_request, show accept and deny buttons
          if (widget.action == 'friend_request')
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  AcceptRequestButton(userID: userID),
                  DenyRequestButton(userID: userID),
                ],
              ),
            ),
        ],
      ),
      // horizontal line
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
