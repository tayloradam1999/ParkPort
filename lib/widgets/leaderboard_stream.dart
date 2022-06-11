import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';
import 'leaderboard_result.dart';

class LeaderboardList extends StatelessWidget {
  const LeaderboardList({Key? key}) : super(key: key);

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
              shrinkWrap: true,
              children: users.map(
                (user) {
                  return LeaderboardsResult(
                    name: user.userName,
                    merits: user.points.toString(),
                    imgUrl: user.profilePicUrl,
                    userID: user.userID,
                    action: 'friend',
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
