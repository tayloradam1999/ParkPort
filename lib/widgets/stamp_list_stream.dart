import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/stamp.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../utils/streams.dart';

class StampList extends StatelessWidget {
  const StampList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    return StreamBuilder<List<Stamp>>(
        stream: getAllStamps(),
        builder: (BuildContext context, AsyncSnapshot<List<Stamp>> snapshot) {
          if (snapshot.hasData) {
            final stamps = snapshot.data!;
            return ListView(
              shrinkWrap: true,
              children: stamps.map(
                (stamp) {
                  return currentUser.collectedStampList.contains(stamp.stampID)
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(stamp.imageURL),
                        )
                      : Container();
                },
              ).toList(),
            );
          } else {
            return Text('No stamps yet');
          }
        });
  }
}
