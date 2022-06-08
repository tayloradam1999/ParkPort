import 'package:flutter/material.dart';

class RemoveNotification extends StatefulWidget {
  const RemoveNotification({Key? key}) : super(key: key);

  @override
  State<RemoveNotification> createState() => _RemoveNotificationState();
}

class _RemoveNotificationState extends State<RemoveNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Colors.yellow,
        highlightColor: Colors.blue,
        child: Icon(Icons.close_rounded, size: 40, color: Colors.red),
        onTap: () {},
        // Force rebuild - fallback option on how to do this
      ),
    );
  }
}
