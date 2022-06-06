import 'package:flutter/material.dart';
import 'package:park_port/widgets/bottom_bar.dart';
import '../widgets/edit_profile_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_status.dart';
import '../widgets/profile_stamps.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            ProfileStatus(),
            ProfileStamps(),
            SizedBox(height: 90.0),
            if (Provider.of<AppState>(context, listen: false).pageIndex == 5)
              EditProfileButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
