import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/park_details_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            ParkDetailsCard(),
          ],
        )),
        SingleChildScrollView(
            child: Column(
          children: [
            ParkDetailsCard(),
          ],
        )),
        SingleChildScrollView(
            child: Column(
          children: [
            ParkDetailsCard(),
          ],
        )),
      ]),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
