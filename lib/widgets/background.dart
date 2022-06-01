import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/top1green.png",
              width: size.width,
              opacity: AlwaysStoppedAnimation(0.8),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/top2green.png",
              width: size.width,
              opacity: AlwaysStoppedAnimation(0.5),
            ),
          ),
          Positioned(
            top: 60,
            left: 22.5,
            child: Image.asset("assets/images/pplogo2.png",
                width: size.width * 0.25, height: size.width * 0.25),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bottom1green.png",
              width: size.width,
              opacity: AlwaysStoppedAnimation(0.8),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bottom2green.png",
              width: size.width,
              opacity: AlwaysStoppedAnimation(0.5),
            ),
          ),
          child
        ],
      ),
    );
  }
}
