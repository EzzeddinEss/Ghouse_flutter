import 'package:flutter/material.dart';
import 'package:green_house/widgets/constants.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        height: 200,
        width: size.width,
        decoration: BoxDecoration(color: kPrimaryColor),
      ),
    );
  }
}
