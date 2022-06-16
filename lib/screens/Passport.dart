import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/sidebar.dart';

class Passports extends StatefulWidget {
  const Passports({Key? key}) : super(key: key);

  @override
  _PassportsState createState() => _PassportsState();
}

class _PassportsState extends State<Passports> {
  PageController? _pageController;

  // Links to stamp urls
  List<String> images = [
    'assets/images/holbie_stamp.png',
    'assets/images/new_chandler.png',
  ];

  // String to display on bottom of each carousel item
  List<String> titles = [
    'Holbie',
    'Chandler',
  ];

  List<String> ids = [
    'R9BqEfgqVkHu4icod6CB',
    'FGsLCt5wF1mufMdheXzq',
  ];

  // Controls the current page of the carousel
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: activePage,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Passport',
          style: TextStyle(
            color: Color(0xFFe05e4a),
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color.fromARGB(199, 192, 231, 130),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFe05e4a), Color(0xFFe7b732)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    bool active = pagePosition == activePage;
                    return GestureDetector(
                      child: slider(images, pagePosition, active, context),
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => ImageDialog(
                                image: images[pagePosition],
                                name: titles[pagePosition],
                                id: ids[pagePosition]));
                      },
                    );
                  }),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, activePage)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                titles[activePage],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFe05e4a),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomMenuBar(),
    );
  }
}

AnimatedContainer slider(images, pagePosition, active, context) {
  double margin = active ? 10 : 20;
  PPUser currentUser =
      Provider.of<AppState>(context, listen: false).currentUser;

  List<String> ids = [
    'R9BqEfgqVkHu4icod6CB',
    'FGsLCt5wF1mufMdheXzq',
  ];
  // I think this is where the condition will be to check
  // if the user has or has not collected a stamp.

  // Image.asset has a colorFilter property, so if the user has NOT
  // collected a stamp, the image should be grayed/blackened out.

  return AnimatedContainer(
    duration: Duration(milliseconds: 0),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      image: DecorationImage(
        scale: 0.75,
        colorFilter: currentUser.collectedStampList.contains(ids[pagePosition])
            ? null
            : ColorFilter.mode(
                Colors.black.withOpacity(active ? 0.75 : 0), BlendMode.darken),
        image: Image.asset(
          images[pagePosition],
          fit: BoxFit.cover,
        ).image,
      ),
    ),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  // Small animation that makes selected image bigger and the rest smaller.
  // (Not really being seen, but could be used more if styling changes later)

  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);
      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  // Cute carousel indicators :3

  return List<Widget>.generate(imagesLength, (index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.white : Colors.grey,
              shape: BoxShape.circle),
        ),
      ],
    );
  });
}

class ImageDialog extends StatelessWidget {
  final String image;
  final String name;
  final String id;

  const ImageDialog(
      {Key? key, required this.image, required this.name, required this.id})
      : super(key: key);

  // On click, opens the stamp in dialog.

  // There can be another check here to see if the user has collected the stamp,
  // so the stamp can be grayed out in the dialog, as well.

  // Another approach could be to check if the user has collected the stamp,
  // and if not, do not allow them to open the dialog.

  // The image url is being passed on line 94.

  @override
  Widget build(BuildContext context) {
    PPUser currentUser =
        Provider.of<AppState>(context, listen: false).currentUser;

    List<String> ids = [
      'R9BqEfgqVkHu4icod6CB',
      'FGsLCt5wF1mufMdheXzq',
    ];

    return Dialog(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Image.asset(
              image,
              // fit: BoxFit.cover,
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xFFe05e4a),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Color(0xFFe05e4a),
                  width: 3,
                ),
              )),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Collected?',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: currentUser.collectedStampList.contains(id)
                          ? Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(
            //         'Date Collected:',
            //         style: TextStyle(
            //           fontSize: 20,
            //         ),
            //       ),
            //       Text(
            //         '12/12/2020',
            //         style: TextStyle(
            //           fontSize: 20,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(
            //         'Times Collected:',
            //         style: TextStyle(
            //           fontSize: 20,
            //         ),
            //       ),
            //       Text(
            //         '3',
            //         style: TextStyle(
            //           fontSize: 20,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
