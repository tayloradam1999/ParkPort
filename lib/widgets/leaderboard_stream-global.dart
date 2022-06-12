import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import '../utils/utils.dart';
import './user_search_result.dart';

class GlobalLeaderboardStream extends StatelessWidget {
  GlobalLeaderboardStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<PPUser>>(
        stream: getTop10Users(),
        builder: (BuildContext context, AsyncSnapshot<List<PPUser>> snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              controller: ScrollController(),
              children: users.map(
                (user) {
                  return UsersSearchResultsWidget(
                    name: user.userName,
                    imgUrl: user.profilePicUrl,
                    userID: user.userID,
                    type: whatTypeOfUser(currentUser, user),
                    collectedStampList: user.collectedStampList,
                    friendList: user.friendList,
                  );
                },
              ).toList(),
            );
          } else {
            return Container();
          }
        });
  }
}
