import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomSubmitButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  CustomSubmitButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        onPressed();
      },
      text: label,
      shape: GFButtonShape.pills,
      size: GFSize.LARGE,
      fullWidthButton: true,
      color: Color(0xFF8eb057),
    );
  }
}
