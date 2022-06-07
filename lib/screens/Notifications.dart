import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/friend_requests.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/no_notifications.dart';
import '../widgets/notification_item.dart';
import '../widgets/sidebar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFFe05e4a),
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromARGB(199, 192, 231, 130),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFFe05e4a),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
      ),
      body: FutureBuilder<List<PPUser>>(
        future: getInfoAboutFriendRequests(currentUser),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length != 0) {
              return ListView.builder(
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
              return NoNotifications();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
