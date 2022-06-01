import 'package:flutter/material.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 350,
      child: Column(
        children: [
          Text('No Notifications available',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFFe05e4a),
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15),
          Text(
            'When new notifications are found, they will be displayed here.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
