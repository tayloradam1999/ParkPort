import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';

class Leaderboards extends StatefulWidget {
  const Leaderboards({Key? key}) : super(key: key);

  @override
  _LeaderboardsState createState() => _LeaderboardsState();
}

class _LeaderboardsState extends State<Leaderboards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Leaderboards',
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
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              onPressed: () {},
              child: Text(
                'Global',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
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
                  fontFamily: GoogleFonts.poppins().fontFamily,
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
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 250,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg'),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text("Adam Taylor")
                        ],
                      ),
                      leading: Text(
                        "#${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("Merits: 0",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                        color: Color(0xFFe05e4a),
                        indent: 10,
                        endIndent: 10,
                      ),
                  itemCount: 10),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
