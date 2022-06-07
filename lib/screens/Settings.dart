import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/_temp_stamp.dart';
import '../utils/storage_service.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/change_profile_field.dart';
import '../widgets/change_profile_pic.dart';
import '../widgets/profile_card.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late TextEditingController _nameEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Color(0xFFe05e4a),
            onPressed: () => Navigator.pushReplacementNamed(context, '/Home')),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFFe05e4a),
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        backgroundColor: Color.fromARGB(199, 192, 231, 130),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileCard(),
            ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
              ChangeProfileField(label: 'Change Name', onChange: () async {}),
              ChangeProfileField(label: 'Change Email', onChange: () async {}),
              ChangeProfileField(
                  label: 'Change Password', onChange: () async {}),
              ChangeProfilePic(
                  label: 'Upload New Profile Pic',
                  onChange: () async {
                    // Trigger file picker steps and set state so will re-render
                    String url = await pickImageFromDevice(context);
                    setState(() {
                      Provider.of<AppState>(context, listen: false)
                          .currentUser
                          .profilePicUrl = url;
                    });
                  }),
            ]),
            TextButton(
                onPressed: () {
                  addStampToUser(
                      context, currentUser.userID, 'FGsLCt5wF1mufMdheXzq');
                },
                child: Text('Button!'))
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
