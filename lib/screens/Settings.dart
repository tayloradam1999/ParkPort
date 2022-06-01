import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_port/widgets/bottom_bar.dart';

import '../models/user.dart';
import '../providers/auth_state.dart';

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
            FutureBuilder(
              future: AuthState().getCurrentUserModel(),
              builder: (BuildContext context, AsyncSnapshot<PPUser> snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(snapshot.data!.profilePicUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        snapshot.data!.userName,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.mulish().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        '${snapshot.data!.friendList.length} Friends, ${snapshot.data!.points} Merits',
                      ),
                      trailing: GFToggle(
                        value: true,
                        onChanged: (value) {},
                        enabledTrackColor: Color.fromARGB(255, 255, 177, 41),
                      ),
                    ),
                    elevation: 8,
                    shadowColor: Color.fromARGB(255, 255, 136, 34),
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 177, 41),
                            width: 1)),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                width: size.width * 0.8,
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            // overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Change Name',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.mulish().fontFamily,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Submitß"),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Change Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    ),
                  ),
                  color: Color(0xFF8eb057),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            // overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Change Email',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.mulish().fontFamily,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Submitß"),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Change Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    ),
                  ),
                  color: Color(0xFF8eb057),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.8,
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            clipBehavior: Clip.hardEdge,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Change Password',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.mulish().fontFamily,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: TextFormField(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        'Confirm Password',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              GoogleFonts.mulish().fontFamily,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: TextFormField(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Submitß"),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.mulish().fontFamily,
                    ),
                  ),
                  color: Color(0xFF8eb057),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
