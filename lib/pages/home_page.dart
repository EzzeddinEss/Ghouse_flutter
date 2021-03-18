import 'package:flutter/material.dart';

import '../models/network.dart';
import '../widgets/button_state_control.dart';
import '../widgets/devices.dart';
import '../widgets/weather_status.dart';
import '../models/location.dart';
import '../widgets/bottomNavBar.dart';
import '../pages/main_page.dart';
import 'setting.dart';
import 'status_page.dart';

const apiKey = '44bb3f265275459c2c9f5a84eedbda66';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double latitude;
  double longitude;

  int _selectedIndex = 1;
  List<Widget> _children;

  @override
  void initState() {
    _children = [
      MainPage(),
      StatusPage(),
      SettingPage(),
    ];

    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latidue;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=apiKey');

    var weatherData = await networkHelper.getData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('$_selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

// double temeprature = decodeData['main']['temp'];
//     int condition = decodeData['weather'][0]['id'];
//     String cityName = decodeData['name'];
