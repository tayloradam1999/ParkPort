import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class BottomMenuBar extends StatefulWidget {
  const BottomMenuBar({Key? key}) : super(key: key);

  @override
  State<BottomMenuBar> createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.notification_add_outlined,
    Icons.menu_book,
    Icons.emoji_people,
    Icons.bar_chart,
  ];

  _buildIcon(int index) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            switch (_selectedIndex) {
              case 0:
                appState.setpageIndex = 0;
                Navigator.pushReplacementNamed(context, '/Home');
                break;
              case 1:
                appState.setpageIndex = 1;
                Navigator.pushReplacementNamed(context, '/Notifications');
                break;
              case 2:
                appState.setpageIndex = 2;
                Navigator.pushReplacementNamed(context, '/Passport');
                break;
              case 3:
                appState.setpageIndex = 3;
                Navigator.pushReplacementNamed(context, '/FriendsList');
                break;
              case 4:
                appState.setpageIndex = 4;
                Navigator.pushReplacementNamed(context, '/Leaderboards');
                break;
            }
          },
          child: SizedBox(
            height: 60.0,
            width: 60.0,
            child: Icon(
              _icons[index],
              size: 25.0,
              color: appState.pageIndex == index
                  ? Color(0xFFe05e4a)
                  : Colors.grey.shade500,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromARGB(199, 192, 231, 130),
      elevation: 0.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildIcon(0),
            _buildIcon(1),
            _buildIcon(2),
            _buildIcon(3),
            _buildIcon(4),
          ],
        ),
      ),
    );
  }
}

class ChatScreen {}
