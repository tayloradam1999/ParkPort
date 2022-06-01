import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_bar.dart';

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
          child: Card(
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Ink.image(
                      image: AssetImage('assets/images/chandler.jpg'),
                      child: InkWell(
                        onTap: () {},
                      ),
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        'Chandler Park',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                  child: Text(
                    'Summary:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                  child: const Text(
                    '192 acres of wooded area with natural beauty and panoramic views of Tulsa and Sand Springs. There is a splash park, rock climbing, trails, baseball complex, playgrounds, restrooms, picnic shelters, 18-hole disc golf course and community center.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                  child: Text(
                    'Address:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('6500 W 21st St, Tulsa, OK 74107',
                          style: TextStyle(color: Color(0xFFe05e4a))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                  child: Text(
                    'Stamps Available:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Stamp1',
                          style: TextStyle(color: Color(0xFFe05e4a))),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Stamp2',
                          style: TextStyle(color: Color(0xFFe05e4a))),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Stamp3',
                          style: TextStyle(color: Color(0xFFe05e4a))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                  child: Text(
                    'Events Available:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Event1'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Event2'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Event3'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
