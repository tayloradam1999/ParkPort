import 'package:flutter/material.dart';
import './leaderboard_stream-friends.dart';
import './leaderboard_stream-global.dart';

class LeaderboardSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaderboardSwitch();
  }
}

class _LeaderboardSwitch extends State<LeaderboardSwitch> {
  late Widget widgetHolder;
  late bool widgetBool;

  void initState() {
    // Initially set to global leaderboard
    widgetHolder = globalLeaderboardStream();
    widgetBool = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  widgetHolder = globalLeaderboardStream();
                  widgetBool = false;
                });
              },
              child: Text(
                'Global',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color:
                  !widgetBool ? Color(0xFF8eb057) : Color(0xFFe7b732),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  widgetHolder = friendsLeaderboardStream();
                  widgetBool = true;
                });
              },
              child: Text(
                'Friends',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: widgetBool ? Color(0xFF8eb057) : Color(0xFFe7b732),
            ),
          ]),
        ),
        widgetHolder,
      ],
    );
  }

  Widget globalLeaderboardStream() {
    return GlobalLeaderboardStream();
  }

  Widget friendsLeaderboardStream() {
    return FriendsLeaderboardStream();
  }
}
