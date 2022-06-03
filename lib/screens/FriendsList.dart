import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/matching_users_list.dart';
import '../widgets/sidebar.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({Key? key}) : super(key: key);
  @override
  _FriendsListState createState() => _FriendsListState();
}
class _FriendsListState extends State<FriendsList> {
  // SearchController
  final _searchController = TextEditingController();
  @override
  void initState() {
    // init state
    super.initState();
    // set controllers
    _searchController.addListener(() {
      // set state
      setState(() {});
    });
  }
  @override
  void dispose() {
    // dispose controllers
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(199, 192, 231, 130),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: SizedBox(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              contentPadding: const EdgeInsets.all(7.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFFe05e4a),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
      ),
      body: SearchUsers(
        searchText: _searchController.text,
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
