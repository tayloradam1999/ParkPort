import 'package:flutter/material.dart';
import './accept_request_button.dart';
import './deny_request_button.dart';

class NotificationItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
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
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFe05e4a),
                    ),
                  ),
                ),
                if (action == 'friend_request')
                  Text(
                    'Sent you a friend request',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (action == 'got_stamp')
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
          if (action == 'friend_request')
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
