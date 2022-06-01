import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';

class Passports extends StatefulWidget {
  const Passports({Key? key}) : super(key: key);

  @override
  _PassportsState createState() => _PassportsState();
}

class _PassportsState extends State<Passports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Passport',
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
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
