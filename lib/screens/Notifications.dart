import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';

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
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
