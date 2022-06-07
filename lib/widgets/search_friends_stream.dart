import 'package:flutter/material.dart';
import 'package:park_port/utils/user_search.dart';
import 'package:park_port/utils/utils.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/user_search_result.dart';
import '../models/user.dart';

class SearchFriends extends StatelessWidget {
  final String searchText;
  const SearchFriends({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser = Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<PPUser>>(
        stream: getAllUsers(context, searchText.toLowerCase(), currentUser),
        builder: (BuildContext context, AsyncSnapshot<List<PPUser>> snapshot) {
            if (snapshot.hasData && snapshot.data!.length != 0) {
              final users = snapshot.data!;
              return ListView(
                shrinkWrap: true,
                children: users.map(
                  (user) {
                    return isFriend(currentUser, user.userID) ?
                    GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/Profile');
                            },
                            child: UsersSearchResultsWidget(
                              name: user.userName,
                              merits: user.points.toString(),
                              imgUrl: user.profilePicUrl,
                              userID: user.userID,
                              action: 'friend',
                            ),
                          ) : Container();
                  },
                ).toList(),
              );
            } else {
              return Text('No users with that name');
            }
          });
  }
}
