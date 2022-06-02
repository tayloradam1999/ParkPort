import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
