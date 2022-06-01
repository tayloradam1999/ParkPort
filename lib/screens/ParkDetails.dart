import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/park_details_card.dart';

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
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Park Details',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ParkDetailsCard(),
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
