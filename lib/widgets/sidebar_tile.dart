import 'package:flutter/material.dart';
import '../providers/app_state.dart';

class SideBarTile extends StatefulWidget {
  const SideBarTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  _SideBarTileState createState() => _SideBarTileState();
}

class _SideBarTileState extends State<SideBarTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
        color: Color(0xFFe05e4a),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        widget.onTap();
      },
      minLeadingWidth: 0,
      mouseCursor: MaterialStateMouseCursor.clickable,
    );
  }
}
