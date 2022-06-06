import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/park_details_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        child: Column(
          children: <Widget>[
            CarouselSlider(
              items: [ParkDetailsCard(), ParkDetailsCard(), ParkDetailsCard()],
              options: CarouselOptions(
                height: size.height,
                viewportFraction: 0.95,
                // enlargeCenterPage: true, // looks great, but overflows on transition
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
