import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
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
// PageController

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
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: AuthState().getCurrentUserModel(),
              builder: (BuildContext context, AsyncSnapshot<PPUser> snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(snapshot.data!.profilePicUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        snapshot.data!.userName,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.mulish().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        '${snapshot.data!.friendList.length} Friends, ${snapshot.data!.points} Merits',
                      ),
                      trailing: GFToggle(
                        value: true,
                        onChanged: (value) {},
                        enabledTrackColor: Color(0xFFe05e4a),
                      ),
                    ),
                    elevation: 8,
                    shadowColor: Color(0xFFe05e4a),
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color(0xFFe7b732), width: 1.5)),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Map(),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
