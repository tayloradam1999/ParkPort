import 'package:flutter/material.dart';
import '../widgets/search_friends_stream.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/search_users_stream.dart';
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
        title: Container(
          child: TextField(
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFe05e4a),
            ),
            cursorColor: Color(0xFFe05e4a),
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Color(0xFFe05e4a),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFFe05e4a),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Color(0xFFe05e4a),
                ),
                onPressed: () {
                  // clear search
                  _searchController.clear();
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.emoji_people,
              color: Color(0xFFe05e4a),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Friends',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFe05e4a),
                ),
              ),
            ),
            SearchFriendsStream(searchText: _searchController.text),
            SearchUsersStream(
              searchText: _searchController.text,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}
