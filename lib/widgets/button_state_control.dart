import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  CustomFloatingActionButton({Key key}) : super(key: key);

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  Icon fab = Icon(Icons.refresh);
  Color backGroundColor = Colors.green;

  int fabIconNumber = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: fab,
      onPressed: () {
        setState(() {
          if (fabIconNumber == 0) {
            fab = Icon(Icons.stop);
            fabIconNumber = 1;
            backGroundColor = Colors.grey;
          } else {
            fab = Icon(Icons.refresh);
            fabIconNumber = 0;
            backGroundColor = Colors.green;
          }
        });
      },
      backgroundColor: backGroundColor,
    );
  }
}
