import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: 200,
        width: size.width,
        decoration: BoxDecoration(color: Colors.amber),
      ),
    );
  }
}
