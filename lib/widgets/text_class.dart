import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color colour;
  final double fontsize;
  final Alignment kAlignment;

  CustomText(
      {@required this.text,
      @required this.colour,
      @required this.fontsize,
      this.kAlignment});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: kAlignment,
      child: Text(
        text,
        style: TextStyle(color: colour, fontSize: fontsize),
      ),
    );
  }
}
