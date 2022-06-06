import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/friend_requests.dart';

class UsersSearchResultsWidget extends StatefulWidget {
  final String name;
  final String merits;
  final String imgUrl;
  final String userID;

  const UsersSearchResultsWidget({
    Key? key,
    required this.name,
    required this.merits,
    required this.imgUrl,
    required this.userID,
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
    PPUser currentUser = Provider.of<AppState>(context).currentUser;

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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  widget.merits + ' merits ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      sendFriendRequest(currentUser.userID, widget.userID);
                    },
                    child: const Text('Send Request'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFe7b732))))),
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
