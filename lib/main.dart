import 'package:flutter/material.dart';

import './pages/home_page.dart';

void main() => runApp(GreenHouse());

class GreenHouse extends StatelessWidget {
  const GreenHouse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
