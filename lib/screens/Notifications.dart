import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/accept_request_button.dart';
import '../widgets/deny_request_button.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 100,
            width: 350,
            child: Column(
              children: [
                Text('No Notifications available',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFe05e4a),
                      fontFamily: GoogleFonts.mulish().fontFamily,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 15),
                Text(
                  'When new notifications are found, they will be displayed here.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                    fontFamily: GoogleFonts.mulish().fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
