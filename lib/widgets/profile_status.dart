import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/general.dart';

class ProfileStatus extends StatefulWidget {
  final PPUser user;
  const ProfileStatus({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileStatus> createState() => _ProfileStatusState();
}

class _ProfileStatusState extends State<ProfileStatus> {
// Define property types
  late TextEditingController _statusController;

// Decorators don't do anything - just for clarity
  @override
  @mustCallSuper
  void initState() {
    // Initializes state and mounts - data, properties
    // Subscribes to state changes
    super.initState();
    _statusController = TextEditingController();
  }

  @override
  @mustCallSuper
  void dispose() {
    // Permanently remove everything at end of lifecycle (after unmount)
    _statusController.dispose();
    super.dispose();
  }

  void updateStatus() async {
    final currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;
    // If changing display name, update it in both Firebase and AppState
    if (currentUser.status != _statusController.text &&
        _statusController.text != '') {
      currentUser.status = _statusController.text;
      usersRef.doc(currentUser.userID).update({
        'status': currentUser.status,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: FutureBuilder(
          // Run async code dependent on results of "future" query listed below
          future: getUserByID(widget.user.userID),
          builder: (BuildContext context, AsyncSnapshot<PPUser> snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              // When results returned from async code, return widget using data from results
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                        color: Color(0xFFe05e4a),
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Color(0xFFe05e4a),
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      widget.user.status,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: 300.00,
                    child: RaisedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Update Status'),
                                content: TextField(
                                  controller: _statusController,
                                  maxLength: 20,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your status',
                                  ),
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text('Save'),
                                    color: Color(0xFFe7b732),
                                    onPressed: () async {
                                      updateStatus();
                                      setState(() {});
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        elevation: 0.0,
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Color(0xFFe05e4a), Color(0xFFe7b732)]),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Provider.of<AppState>(context, listen: false)
                                      .currentUser
                                      .userID ==
                                  widget.user.userID
                              ? Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              : Container(),
                        )),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
