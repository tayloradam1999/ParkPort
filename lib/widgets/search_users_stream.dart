import 'package:flutter/material.dart';
import 'package:park_port/utils/utils.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../utils/friend_requests.dart';
import '../widgets/user_search_result.dart';
import '../models/user.dart';

class SearchUsers extends StatelessWidget {
  final String searchText;
  const SearchUsers({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<PPUser>>(
        stream: getMatchingUsers(searchText.toLowerCase(), currentUser),
        builder: (BuildContext context, AsyncSnapshot<List<PPUser>> snapshot) {
          if (searchText != '') {
            if (snapshot.hasData && snapshot.data!.length != 0) {
              final users = snapshot.data!;
              return ListView(
                shrinkWrap: true,
                children: users.map(
                  (user) {
                    return isFriend(currentUser, user.userID)
                    // If not friend, that is displayed in search_friends_stream so don't include here
                        ? Container()
                        : UsersSearchResultsWidget(
                            name: user.userName,
                            merits: user.points.toString(),
                            imgUrl: user.profilePicUrl,
                            userID: user.userID,
                            action: isPendingFriend(user, currentUser.userID)
                                .toString(),
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
