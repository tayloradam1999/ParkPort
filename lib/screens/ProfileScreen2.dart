import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/general.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_status2.dart';
import '../widgets/profile_stamps.dart';

class Profile2 extends StatelessWidget {
  final String userID;
  const Profile2({Key? key, required this.userID}) : super(key: key);

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
      body: FutureBuilder(
        // Run async code dependent on results of "future" query listed below
        future: getUserByID(userID),
        builder: (BuildContext context, AsyncSnapshot<PPUser> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            // When results returned from async code, return widget using data from results
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(user: snapshot.data!),
                  ProfileStatus2(user: snapshot.data!),
                  ProfileStamps(user: snapshot.data!),
                  SizedBox(height: 110.0),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
