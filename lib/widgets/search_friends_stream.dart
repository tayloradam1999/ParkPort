import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import './user_search_result.dart';

class SearchFriendsStream extends StatelessWidget {
  final String searchText;
  const SearchFriendsStream({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<PPUser>>(
        stream: getAllMatchingUsers(context, searchText.toLowerCase(), currentUser),
        builder: (BuildContext context, AsyncSnapshot<List<PPUser>> snapshot) {
          if (snapshot.hasData && snapshot.data!.length != 0) {
            final users = snapshot.data!;
            return ListView(
              shrinkWrap: true,
              children: users.map(
                (user) {
                  return currentUser.friendList.contains(user.userID)
                      ? Container(
                          child: UsersSearchResultsWidget(
                            name: user.userName,
                            imgUrl: user.profilePicUrl,
                            userID: user.userID,
                            type: 'friend',
                            collectedStampList: user.collectedStampList,
                            friendList: user.friendList,
                          ),
                        )
                      : Container();
                },
              ).toList(),
            );
          } else {
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No friends found',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.emoji_people,
                      size: 40,
                      color: Color(0xFFe05e4a),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
