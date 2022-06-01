import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../providers/auth_state.dart';
import '../storage/storage_service.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/change_profile_field.dart';
import '../widgets/change_profile_pic.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late TextEditingController _nameEditingController;
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  final _formKey = GlobalKey<FormState>();

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
    Size size = MediaQuery.of(context).size;
    final Storage storage = Storage();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.pushReplacementNamed(context, '/Home')),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
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
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      Provider.of<AppState>(context, listen: false)
                          .currentUser
                          .profilePicUrl),
                  backgroundColor: Colors.transparent,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Provider.of<AppState>(context, listen: false)
                          .currentUser
                          .userName,
                      style: TextStyle(
                        color: Color(0xFFe05e4a),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.mulish().fontFamily,
                      ),
                    ),
                    Text(
                      Provider.of<AppState>(context, listen: false)
                          .currentUser
                          .status,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.mulish().fontFamily,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  '${Provider.of<AppState>(context, listen: false).currentUser.collectedStampList.length} Stamps, ${Provider.of<AppState>(context, listen: false).currentUser.points} Merits',
                  style: TextStyle(color: Color(0xFFe7b732)),
                ),
                trailing: GFToggle(
                  value: true,
                  onChanged: (value) {},
                  enabledTrackColor: Color(0xFFe05e4a),
                ),
              ),
              elevation: 15,
              shadowColor: Color(0xFFe05e4a),
              margin: EdgeInsets.all(15),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFe7b732), width: 1.5)),
            ),
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
              // ChangeProfileField(label: 'Take New Photo', onChange: () async {}),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}