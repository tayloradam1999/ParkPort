import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';

class ProfileCard extends StatefulWidget {
  ProfileCard({Key? key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(currentUser.profilePicUrl),
          backgroundColor: Colors.transparent,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentUser.userName,
              style: TextStyle(
                color: Color(0xFFe05e4a),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              currentUser.status,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Text(
          '${currentUser.collectedStampList.length} Stamps, ${currentUser.friendList.length} Friends',
          style: TextStyle(
            color: Color(0xFFe7b732),
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Image.asset(
          'assets/images/indian_blanket.jpg',
          fit: BoxFit.contain,
          height: 75,
        ),
      ),
      elevation: 20,
      shadowColor: Color(0xFFe05e4a),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFe05e4a), width: 2)),
    );
  }
}
