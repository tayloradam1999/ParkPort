import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_port/providers/app_state.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/map.dart';
import '../models/user.dart';
import '../providers/auth_state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // init state
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    PPUser user = await AuthState().getCurrentUserModel();
    setState(() {
      // Get user data from Firebase
      Provider.of<AppState>(context, listen: false).currentUser = user;
    });
  }

  @override
  void dispose() {
    // dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/titlecolor.png',
          fit: BoxFit.contain,
          height: 32.5,
        ),
        backgroundColor: Color.fromARGB(199, 192, 231, 130),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    Provider.of<AppState>(context, listen: false)
                        .currentUser
                        .profilePicUrl),
                backgroundColor: Colors.transparent,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Provider.of<AppState>(context, listen: false)
                        .currentUser
                        .userName,
                    style: TextStyle(
                      color: Color(0xFFe05e4a),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    ),
                  ),
                  Text(
                    Provider.of<AppState>(context, listen: false)
                        .currentUser
                        .status,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                '${Provider.of<AppState>(context, listen: false).currentUser.collectedStampList.length} Stamps, ${Provider.of<AppState>(context, listen: false).currentUser.points} Merits',
                style: TextStyle(color: Color(0xFFe7b732)),
              ),
              trailing: GFToggle(
                value: true,
                onChanged: (value) {},
                enabledTrackColor: Color(0xFFe05e4a),
              ),
            ),
            elevation: 15,
            shadowColor: Color(0xFFe05e4a),
            margin: EdgeInsets.all(15),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFe7b732), width: 1.5)),
          ),
          Map()
        ]),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
