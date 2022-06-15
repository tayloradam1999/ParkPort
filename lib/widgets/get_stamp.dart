import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/messages.dart';
import '../utils/notifications.dart';

class GetStamp extends StatefulWidget {
  const GetStamp({Key? key}) : super(key: key);

  @override
  State<GetStamp> createState() => _GetStampState();
}

class _GetStampState extends State<GetStamp> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: RaisedButton(
        onPressed: () {
          if (currentUser.collectedStampList.contains('R9BqEfgqVkHu4icod6CB')) {
            showMessage(context, 'You already have that stamp!', 'red');
          } else {
            addStampToUser(currentUser, 'R9BqEfgqVkHu4icod6CB');
            showMessage(context, 'You have a new stamp!', 'green');
            setState(() {
              currentUser.collectedStampList.add('R9BqEfgqVkHu4icod6CB');
              currentUser.points += 10;
            });
          }
        },
        child: Text(
          'Get Stamp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.mulish().fontFamily,
          ),
        ),
        color: Color(0xFF8eb057),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
