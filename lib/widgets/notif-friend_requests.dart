import 'package:flutter/material.dart';
import '../widgets/no_notifications.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/friend_requests.dart';
import './notification_item.dart';

class FriendRequests extends StatelessWidget {
  const FriendRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return FutureBuilder<List<PPUser>>(
      future: getInfoAboutFriendRequests(currentUser),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                  name: snapshot.data![index].userName,
                  action: 'friend_request',
                  imgUrl: snapshot.data![index].profilePicUrl,
                  userID: snapshot.data![index].userID,
                );
              },
            );
          } else {
            return Text('${snapshot.data?.length}');
            // return NoNotifications();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
