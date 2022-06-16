import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/park_details_card.dart';
import '../widgets/sidebar.dart';

class ParkDetails extends StatefulWidget {
  const ParkDetails({Key? key}) : super(key: key);

  @override
  _ParkDetailsState createState() => _ParkDetailsState();
}

class _ParkDetailsState extends State<ParkDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Park Details',
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
      body: PageView(children: [
        SingleChildScrollView(
            child: Column(
          children: [
            ParkDetailsCard(
                title: 'Chandler Park',
                summary:
                    '192 acres of wooded area with natural beauty and panoramic views of Tulsa and Sand Springs. There is a splash park, rock climbing, trails, baseball complex, playgrounds, restrooms, picnic shelters, 18-hole disc golf course, and community center.',
                picture: 'assets/images/chandler.png',
                address: '6500 W 21st St, Tulsa, OK 74107',
                stamps: '10'),
          ],
        )),
        SingleChildScrollView(
            child: Column(
          children: [
            ParkDetailsCard(
              title: 'Holberton Tulsa',
              summary:
                  'Holberton is a computer science school founded in Silicon Valley to address a gap in the education system for aspiring software engineers. Since Holberton’s coding school in Tulsa opened its doors, the world’s most innovative companies have begun to take notice.',
              picture: 'assets/images/holberton.jpg',
              address: '15 N Cheyenne Ave, Tulsa, OK 74103',
              stamps: '10',
            ),
          ],
        )),
      ]),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
