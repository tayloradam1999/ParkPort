import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/general.dart';

class ProfileStatus2 extends StatefulWidget {
  final PPUser user;
  const ProfileStatus2({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileStatus2> createState() => _ProfileStatus2State();
}

class _ProfileStatus2State extends State<ProfileStatus2> {
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
                  Container(
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
                        : SizedBox(height: 10),
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
