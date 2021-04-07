import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_house/pages/login_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/network.dart';
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

  int _selectedIndex = 0;
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: new IconButton(
            icon: Icon(Icons.reorder), onPressed: handleLoginOutPopup),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  handleLoginOutPopup() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Login Out",
      desc: "Do you want to login out now?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.teal,
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
          // handleSignOut,
          color: Colors.teal,
        )
      ],
    ).show();
  }

//   Future<Null> handleSignOut() async {
//     this.setState(() {
//       isLoading = true;
//     });

//     await FirebaseAuth.instance.signOut();
//     await googleSignIn.signOut();

//     this.setState(() {
//       isLoading = false;
//     });

//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => LoginPage()),
//         (Route<dynamic> route) => false);
//   }

}

// double temeprature = decodeData['main']['temp'];
//     int condition = decodeData['weather'][0]['id'];
//     String cityName = decodeData['name'];
