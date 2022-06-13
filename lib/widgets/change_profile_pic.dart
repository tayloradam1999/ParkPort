import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeProfilePic extends StatefulWidget {
  final String label;
  final onChange;

  const ChangeProfilePic(
      {Key? key, required this.label, required this.onChange})
      : super(key: key);

  @override
  State<ChangeProfilePic> createState() => _ChangeProfilePicState();
}

class _ChangeProfilePicState extends State<ChangeProfilePic> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String label = widget.label;
    var onChange = widget.onChange;

    return Container(
      width: size.width * 0.8,
      child: RaisedButton(
        onPressed: onChange,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.mulish().fontFamily,
          ),
        ),
        color: Color(0xFF8eb057),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
