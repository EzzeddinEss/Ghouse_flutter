import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import './pages/home_page.dart';
import './pages/login_page.dart';

void main() {
  runApp(GreenHouse());
}

class GreenHouse extends StatelessWidget {
  const GreenHouse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.greenAccent, elevation: 10),
      ),
      home: LoginPage(),
      // HomePage(),
    );
  }
}
