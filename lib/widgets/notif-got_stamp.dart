import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import './no_notifications.dart';
import './notification_item.dart';
import '../utils/_temp_stamp.dart';

class GotStamp extends StatelessWidget {
  const GotStamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return FutureBuilder<List<PPUser>>(
      future: getInfoAboutNewStamp(currentUser),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return currentUser.userID == snapshot.data![index].userID
                    ? NotificationItem(
                        name: currentUser.userName,
                        action: 'got_stamp',
                        imgUrl: currentUser.profilePicUrl,
                        userID: currentUser.userID,
                      )
                    : NotificationItem(
                        name: snapshot.data![index].userName,
                        action: 'got_stamp',
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
