import 'package:flutter/material.dart';

class ParkDetailsCard extends StatefulWidget {
  late String title;
  late String summary;
  late String picture;
  late String address;
  late String stamps;

  ParkDetailsCard({
    Key? key,
    required this.title,
    required this.summary,
    required this.picture,
    required this.address,
    required this.stamps,
  }) : super(key: key);

  @override
  State<ParkDetailsCard> createState() => _ParkDetailsCardState();
}

class _ParkDetailsCardState extends State<ParkDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: AssetImage(widget.picture),
                child: InkWell(
                  onTap: () {},
                ),
                height: 240,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Text(
              'Summary:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Text(
              widget.summary,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Text(
              'Address:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(widget.address,
                    style: TextStyle(color: Color(0xFFe05e4a))),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: Text(
              'Stamps Available:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(widget.stamps,
                    style: TextStyle(color: Color(0xFFe05e4a))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
