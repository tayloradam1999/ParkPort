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
                        color: Color(0xFFe05e4a)),
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
                      color: Color(0xFFe05e4a),
                    ),
                  ]),
            ),
            LeaderboardList(),
          ],
        ),
      ),
      // Column(
      //   children: [
      //     SizedBox(height: 5.0),
      //     Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      //       RaisedButton(
      //         onPressed: () {},
      //         child: Text(
      //           'Global',
      //           style: TextStyle(
      //             fontSize: 16,
      //             fontFamily: GoogleFonts.poppins().fontFamily,
      //             fontWeight: FontWeight.w800,
      //             color: Colors.white,
      //           ),
      //         ),
      //         elevation: 10,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         color: Color(0xFFe7b732),
      //       ),
      //       RaisedButton(
      //         onPressed: () {},
      //         child: Text(
      //           'Friends',
      //           style: TextStyle(
      //             fontSize: 16,
      //             fontFamily: GoogleFonts.poppins().fontFamily,
      //             fontWeight: FontWeight.w800,
      //             color: Colors.white,
      //           ),
      //         ),
      //         elevation: 10,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         color: Color(0xFFe7b732),
      //       ),
      //     ]),
      //     Container(
      //       margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      //       child: SizedBox(
      //         height: MediaQuery.of(context).size.height - 250,
      //         child: ListView.separated(
      //             shrinkWrap: true,
      //             itemBuilder: (context, index) {
      //               return ListTile(
      //                 title: Row(
      //                   children: [
      //                     CircleAvatar(
      //                       backgroundImage: NetworkImage(
      //                           'https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg'),
      //                     ),
      //                     SizedBox(
      //                       width: 3,
      //                     ),
      //                     Text("Adam Taylor")
      //                   ],
      //                 ),
      //                 leading: Text(
      //                   "#${index + 1}",
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //                 trailing: Text("Merits: 0",
      //                     style: TextStyle(fontWeight: FontWeight.bold)),
      //               );
      //             },
      //             separatorBuilder: (context, index) => Divider(
      //                   thickness: 1,
      //                   color: Color(0xFFe05e4a),
      //                   indent: 10,
      //                   endIndent: 10,
      //                 ),
      //             itemCount: 10),
      //       ),
      //     ),
      //   ],
      // ),

      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
