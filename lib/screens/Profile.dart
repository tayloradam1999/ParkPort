import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/edit_profile_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_status.dart';
import '../widgets/profile_stamps.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return IconButton(
            color: Colors.black,
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            ProfileStatus(),
            ProfileStamps(),
            SizedBox(height: 110.0),
            if (Provider.of<AppState>(context, listen: false).pageIndex == 5)
              EditProfileButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
