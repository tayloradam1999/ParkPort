import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import './remove_notification_button.dart';
import './congratulate_button.dart';
import './accept_request_button.dart';
import './deny_request_button.dart';

class NotificationItem extends StatefulWidget {
  final String name;
  final String imgUrl;
  final String action;
  final String userID;
  final String notifID;

  NotificationItem({
    Key? key,
    required this.name,
    required this.imgUrl,
    required this.action,
    required this.userID,
    required this.notifID,
  }) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    String userID = widget.userID;
    String notifID = widget.notifID;
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

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
                    currentUser.userID == widget.userID ? "You" : widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFe05e4a),
                    ),
                  ),
                ),
                if (widget.action == 'friend_request')
                  Text(
                    'Sent you a friend request!',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (widget.action == 'got_stamp')
                  Text(
                    'Got a stamp!',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (widget.action == 'send_congrats')
                  Text(
                    'Congratulated you on your new stamp!',
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
                  AcceptRequestButton(otherUser: userID, notifID: notifID),
                  DenyRequestButton(notifID: notifID),
                ],
              ),
            ),
          if (widget.action == 'got_stamp')
            widget.userID == currentUser.userID
                ? Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        // If user is being notified of own stamp, just show remove button
                        RemoveNotification(notifID: notifID, type: "own_stamp"),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: [
                        CongratulateButton(
                          otherUser: userID,
                          notifID: notifID,
                        ),
                        RemoveNotification(notifID: notifID, type: "other_stamp"),
                      ],
                    ),
                  ),
          if (widget.action == 'send_congrats')
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  RemoveNotification(
                    notifID: notifID,
                    type: "send_congrats",
                  )
                ],
              ),
            )
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
