import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/friend_requests.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/no_notifications.dart';
import '../widgets/notification_item.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser = Provider.of<AppState>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
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
