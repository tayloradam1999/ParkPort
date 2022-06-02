import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class ProfileCard extends StatefulWidget {
  ProfileCard({Key? key}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
              ),
            ),
            Text(
              Provider.of<AppState>(context, listen: false).currentUser.status,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
                fontWeight: FontWeight.w600,
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
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFe05e4a), width: 1.5)),
    );
  }
}
