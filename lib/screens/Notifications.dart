import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/accept_request_button.dart';
import '../widgets/deny_request_button.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NotificationItem(
              name: 'Henry Stevenson',
              action: 'got_stamp',
              imgUrl:
                  'https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg',
            ),
            NotificationItem(
              name: 'Henry Stevenson',
              action: 'friend_request',
              imgUrl:
                  'https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
