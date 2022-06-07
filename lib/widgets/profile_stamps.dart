import 'package:flutter/material.dart';

class ProfileStamps extends StatelessWidget {
  const ProfileStamps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Collected Stamps:",
              style: TextStyle(
                  color: Color(0xFFe05e4a),
                  fontStyle: FontStyle.normal,
                  fontSize: 28.0),
            ),
          ],
        ),
      ),
    );
  }
}
