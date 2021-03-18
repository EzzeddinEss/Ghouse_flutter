import 'package:flutter/material.dart';
import 'package:green_house/widgets/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(color: Colors.indigo[400]),
      ),
    );
  }
}
