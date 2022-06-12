import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_state.dart';
import '../providers/app_state.dart';
import '../models/user.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/map.dart';
import '../widgets/profile_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _switchView = false;

  @override
  void initState() {
    // init state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _populateCurrentUserInfo();
    });
    super.initState();
  }

  void toggleSwitch(bool value) {
    setState(() {
      _switchView = !_switchView;
    });
  }

  _populateCurrentUserInfo() async {
    PPUser user = await AuthState().getCurrentUserModel();
    setState(() {
      // Get user data from Firebase
      Provider.of<AppState>(context, listen: false).currentUser = user;
    });
  }

  @override
  void dispose() {
    // dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/titlecolor.png',
          fit: BoxFit.contain,
          height: 32.5,
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
      body: Container(
        child: Column(children: [
          ProfileCard(),
          Expanded(
            child: Stack(children: [
              Container(child: _switchView ? Map() : Text('No map!')),
              Container(
                alignment: Alignment.topRight,
                child: Switch(
                  onChanged: toggleSwitch,
                  value: _switchView,
                ),
              ),
            ]),
          )
        ]),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
