import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/leaderboard_stream.dart';
import '../widgets/sidebar.dart';

class Leaderboards extends StatefulWidget {
  const Leaderboards({Key? key}) : super(key: key);

  @override
  _LeaderboardsState createState() => _LeaderboardsState();
}

class _LeaderboardsState extends State<Leaderboards> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () {},
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
                      color: Color(0xFFe7b732),
                    ),
                    RaisedButton(
                      onPressed: () {},
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
                      color: Color(0xFFe7b732),
                    ),
                  ]),
            ),
            GlobalLeaderboardStream(),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
