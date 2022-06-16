import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileStamps extends StatelessWidget {
  final PPUser user;
  const ProfileStamps({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/holbie_stamp.png',
                    color:
                        user.collectedStampList.contains('R9BqEfgqVkHu4icod6CB')
                            ? null
                            : Color.fromRGBO(155, 155, 155, 0.5),
                    colorBlendMode: BlendMode.modulate),
                Image.asset('assets/images/chandler_stamp.png',
                    color:
                        user.collectedStampList.contains('FGsLCt5wF1mufMdheXzq')
                            ? null
                            : const Color.fromRGBO(155, 155, 155, 0.5),
                    colorBlendMode: BlendMode.modulate),
              ],
            )
          ],
        ),
      ),
    );
  }
}
