import 'package:flutter/material.dart';
import '../widgets/leaderboard_stream-friends.dart';
import '../widgets/leaderboard_stream-global.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';

class Leaderboards extends StatefulWidget {
  const Leaderboards({Key? key}) : super(key: key);

  @override
  _LeaderboardsState createState() => _LeaderboardsState();
}

class _LeaderboardsState extends State<Leaderboards> {
  late Widget widgetHolder;
  late bool widgetBool;

  void initState() {
    // Initially set to global leaderboard
    widgetHolder = globalLeaderboardStream();
    widgetBool = false;
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Leaderboards',
          style: TextStyle(
            color: Color(0xFFe05e4a),
            fontWeight: FontWeight.w900,
            fontSize: 30,
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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
        ));
      }),
      bottomNavigationBar: BottomMenuBar(),
    );
  }

  Widget globalLeaderboardStream() {
    return GlobalLeaderboardStream();
  }

  Widget friendsLeaderboardStream() {
    return FriendsLeaderboardStream();
  }
}
