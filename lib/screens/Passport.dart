import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_port/widgets/stamp_list_stream.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';

class Passports extends StatefulWidget {
  const Passports({Key? key}) : super(key: key);

  @override
  _PassportsState createState() => _PassportsState();
}

class _PassportsState extends State<Passports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Passport',
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
      body: StampList(),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
