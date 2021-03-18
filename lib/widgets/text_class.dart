import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color colour;
  final double fontsize;

  CustomText(
      {@required this.text, @required this.colour, @required this.fontsize});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: colour, fontSize: fontsize),
      ),
    );
  }
}
