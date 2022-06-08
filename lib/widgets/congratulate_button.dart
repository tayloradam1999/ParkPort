import 'package:flutter/material.dart';

class CongratulateButton extends StatefulWidget {
  const CongratulateButton({Key? key}) : super(key: key);

  @override
  State<CongratulateButton> createState() => _CongraulateButtonState();
}

class _CongraulateButtonState extends State<CongratulateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Colors.yellow,
        highlightColor: Colors.blue,
        child: Icon(Icons.celebration, size: 40, color: Colors.green),
        onTap: () {},
        // Force rebuild - fallback option on how to do this
      ),
    );
  }
}
