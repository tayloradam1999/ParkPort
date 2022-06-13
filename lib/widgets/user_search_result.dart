import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../screens/ProfileScreen2.dart';
import '../utils/notifications.dart';

class UsersSearchResultsWidget extends StatefulWidget {
  final String name;
  final String imgUrl;
  final String userID;
  final String type;
  final List<String> collectedStampList;
  final List<String> friendList;

  const UsersSearchResultsWidget({
    Key? key,
    required this.name,
    required this.imgUrl,
    required this.userID,
    required this.type,
    required this.collectedStampList,
    required this.friendList,
  }) : super(key: key);

  @override
  State<UsersSearchResultsWidget> createState() =>
      _UsersSearchResultsWidgetState();
}

class _UsersSearchResultsWidgetState extends State<UsersSearchResultsWidget> {
  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: widget.type == 'self'
                          ? Color(0xFF8eb057)
                          : Color(0xFFe05e4a),
                    ),
                  ),
                ),
                Text(
                  widget.collectedStampList.length.toString() +
                      ' stamps' +
                      ' • ' +
                      widget.friendList.length.toString() +
                      ' friends',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (widget.type == 'friend')
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile2(userID: widget.userID)),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20, right: 10),
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Color(0xFFe05e4a),
                  size: 40,
                ),
              ),
            ),
          if (widget.type == 'pending')
            Container(
              margin: const EdgeInsets.only(right: 10, top: 20),
              child: Container(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Pending',
                        textAlign: TextAlign.center,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFe7b732),
                        ),
                      ))),
            ),
          if (widget.type == 'other')
            Container(
              margin: const EdgeInsets.only(right: 10, top: 20),
              child: Container(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        sendFriendRequest(currentUser, widget.userID);
                      },
                      child: const Text('Send Request',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF8eb057))))),
            ),
        ],
      ),
      // horizontal line
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFe05e4a),
            width: 1,
          ),
        ),
      ),
    );
  }
}
