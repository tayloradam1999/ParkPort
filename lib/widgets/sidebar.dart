import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';
import './sidebar_tile.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  // SideBarMenu's State
  @override
  State<SideBarMenu> createState() => SideBarMenuState();
}

class SideBarMenuState extends State<SideBarMenu> {
  @override
  void initState() {
    // init state
    super.initState();
    // set controllers
  }

  @override
  void dispose() {
    // dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        Size size = MediaQuery.of(context).size;
        return Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Container(
            color: Color.fromARGB(199, 192, 231, 130),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    margin: EdgeInsets.all(0),
                    // Everything inside drawer uses Consumer
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                          color: Color.fromARGB(255, 245, 236, 160),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFe05e4a),
                              spreadRadius: 4,
                              blurRadius: 5,
                            ),
                            BoxShadow(
                              color: Color(0xFFe05e4a),
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      Provider.of<AppState>(context,
                                              listen: false)
                                          .currentUser
                                          .profilePicUrl),
                                  backgroundColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  Provider.of<AppState>(context, listen: false)
                                      .currentUser
                                      .userName,
                                  style: TextStyle(
                                    color: Color(0xFFe05e4a),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5), // psuedo spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${Provider.of<AppState>(context, listen: false).currentUser.friendList.length} Friends',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(width: 10), // psuedo spacing
                              Text(
                                '${Provider.of<AppState>(context, listen: false).currentUser.collectedStampList.length} Stamps',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(width: 10), // psuedo spacing
                              Text(
                                '${Provider.of<AppState>(context, listen: false).currentUser.points} Merits',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SideBarTile(
                    icon: Icons.account_circle_rounded,
                    title: 'Profile',
                    onTap: () {
                      appState.setpageIndex = 5;
                      Navigator.pushReplacementNamed(context, '/Profile');
                    }),
                SideBarTile(
                    icon: Icons.notification_add_rounded,
                    title: 'Notifications',
                    onTap: () {
                      appState.setpageIndex = 1;
                      Navigator.pushReplacementNamed(context, '/Notifications');
                    }),
                SideBarTile(
                    icon: Icons.menu_book,
                    title: 'Passport',
                    onTap: () {
                      appState.setpageIndex = 2;
                      Navigator.pushReplacementNamed(context, '/Passport');
                    }),
                SideBarTile(
                    icon: Icons.emoji_people,
                    title: 'Friends',
                    onTap: () {
                      appState.setpageIndex = 10;
                      Navigator.pushReplacementNamed(context, '/FriendsList');
                    }),
                SideBarTile(
                    icon: Icons.bar_chart,
                    title: 'Leaderboards',
                    onTap: () {
                      appState.setpageIndex = 4;
                      Navigator.pushReplacementNamed(context, '/Leaderboards');
                    }),
                SideBarTile(
                    icon: Icons.park_outlined,
                    title: 'Park Details',
                    onTap: () {
                      appState.setpageIndex = 3;
                      Navigator.pushReplacementNamed(context, '/ParkDetails');
                    }),
                ListTile(
                  title: Text('Settings and privacy',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  onTap: () {
                    // show no index on bottom bar
                    appState.setpageIndex = 5;
                    Navigator.pushReplacementNamed(context, '/Settings');
                  },
                ),
                ListTile(
                  title: Text('Logout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  onTap: () {
                    AuthState().logout();
                    Navigator.pushReplacementNamed(context, '/Welcome');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
