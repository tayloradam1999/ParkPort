import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String merits;
  final String imgUrl;

  const UsersSearchResultsWidget(
      {Key? key,
      required this.name,
      required this.merits,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
              minRadius: 25,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  merits + ' merits',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send Request'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFe7b732)))),
            ),
          ),
        ],
      ),
    );
  }
}
