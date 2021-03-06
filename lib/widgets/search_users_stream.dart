import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import './user_search_result.dart';

class SearchUsersStream extends StatelessWidget {
  final String searchText;
  const SearchUsersStream({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<PPUser>>(
        stream: get10MatchingUsers(searchText.toLowerCase(), currentUser),
        builder: (BuildContext context, AsyncSnapshot<List<PPUser>> snapshot) {
          if (searchText != '') {
            if (snapshot.hasData && snapshot.data!.length != 0) {
              final users = snapshot.data!;
              return ListView(
                shrinkWrap: true,
                children: users.map(
                  (user) {
                    return currentUser.friendList.contains(user.userID)
                    // If not friend, that is displayed in search_friends_stream so don't include here
                        ? Container()
                        : UsersSearchResultsWidget(
                            name: user.userName,
                            imgUrl: user.profilePicUrl,
                            userID: user.userID,
                            type: user.friendNotifs.contains(currentUser.userID) ? 'pending' : 'other',
                            collectedStampList: user.collectedStampList,
                            friendList: user.friendList,
                          );
                  },
                ).toList(),
              );
            } else {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No users found',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.sentiment_dissatisfied,
                      size: 40,
                      color: Color(0xFFe05e4a),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Container();
          }
        });
  }
}
