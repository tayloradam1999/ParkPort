import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';

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
        return Drawer(
          elevation: 0.0,
          width: MediaQuery.of(context).size.width * 0.8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  // Everything inside drawer uses Consumer
                  child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            Provider.of<AppState>(context, listen: false)
                                .currentUser
                                .profilePicUrl),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
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
                            fontFamily: GoogleFonts.mulish().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10), // psuedo spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${Provider.of<AppState>(context, listen: false).currentUser.friendList.length} Friends',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.mulish().fontFamily,
                        ),
                      ),
                      const SizedBox(width: 10), // psuedo spacing
                      Text(
                        '${Provider.of<AppState>(context, listen: false).currentUser.points} Merits',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.mulish().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Color(0xFFe05e4a),
                ),
                title: Text('Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    )),
                onTap: () {
                  // show no index
                  appState.setpageIndex = 5;
                  Navigator.pushReplacementNamed(context, '/Profile');
                },
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
              ListTile(
                leading: const Icon(
                  Icons.notification_add_rounded,
                  color: Color(0xFFe05e4a),
                ),
                title: Text('Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    )),
                onTap: () {
                  appState.setpageIndex = 1;
                  Navigator.pushReplacementNamed(context, '/Notifications');
                },
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
              ListTile(
                leading: const Icon(
                  Icons.menu_book,
                  color: Color(0xFFe05e4a),
                ),
                title: Text('Passport',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    )),
                onTap: () {
                  appState.setpageIndex = 2;
                  Navigator.pushReplacementNamed(context, '/Passport');
                },
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
              ListTile(
                leading: const Icon(
                  Icons.park_outlined,
                  color: Color(0xFFe05e4a),
                ),
                title: Text('Park Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    )),
                onTap: () {
                  appState.setpageIndex = 3;
                  Navigator.pushReplacementNamed(context, '/ParkDetails');
                },
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
              ListTile(
                leading: const Icon(
                  Icons.bar_chart,
                  color: Color(0xFFe05e4a),
                ),
                title: Text('Leaderboards',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    )),
                onTap: () {
                  appState.setpageIndex = 4;
                  Navigator.pushReplacementNamed(context, '/Leaderboards');
                },
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
              ListTile(
                leading: const Icon(
                  Icons.emoji_people,
                  color: Color(0xFFe05e4a),
                ),
                title: Text(
                  'Friends List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.mulish().fontFamily,
                  ),
                ),
                onTap: () {
                  // show no index on bottom bar
                  appState.setpageIndex = 5;
                  Navigator.pushReplacementNamed(context, '/FriendsList');
                },
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
              Container(
                height: 40,
                child: Divider(
                  color: Colors.grey.shade300,
                ),
              ),
              ListTile(
                title: Text('Settings and privacy',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.mulish().fontFamily)),
                onTap: () {
                  // show no index on bottom bar
                  appState.setpageIndex = 5;
                  Navigator.pushReplacementNamed(context, '/Settings');
                },
              ),
              ListTile(
                title: Text('Logout',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.mulish().fontFamily)),
                onTap: () {
                  AuthState().logout();
                  Navigator.pushReplacementNamed(context, '/Welcome');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
