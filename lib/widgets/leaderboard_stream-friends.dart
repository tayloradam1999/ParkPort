import 'package:flutter/material.dart';
import 'package:park_port/utils/utils.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import './user_search_result.dart';

class FriendsLeaderboardStream extends StatelessWidget {
  const FriendsLeaderboardStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<PPUser>>(
        stream: getTopFriends(),
        builder: (BuildContext context, AsyncSnapshot<List<PPUser>> snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              controller: ScrollController(),
              shrinkWrap: true,
              children: users.map(
                (user) {
                  return currentUser.userID == user.userID ||
                          currentUser.friendList.contains(user.userID)
                      ? UsersSearchResultsWidget(
                          name: user.userName,
                          imgUrl: user.profilePicUrl,
                          userID: user.userID,
                          type: whatTypeOfUser(currentUser, user),
                          collectedStampList: user.collectedStampList,
                          friendList: user.friendList,
                        )
                      : Container();
                },
              ).toList(),
            );
          } else {
            return Container();
          }
        });
  }
}
