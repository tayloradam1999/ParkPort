import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/notifications_stream.dart';
import '../widgets/sidebar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFFe05e4a),
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromARGB(199, 192, 231, 130),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFFe05e4a),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
      ),
      body: NotificationsStream(),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
