import 'package:flutter/material.dart';

import '../models/network.dart';
import '../widgets/button_state_control.dart';
import '../widgets/devices.dart';
import '../widgets/weather_status.dart';
import '../models/location.dart';

const apiKey = '44bb3f265275459c2c9f5a84eedbda66';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latidue;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeatherStatus(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    child: GridView.custom(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      childrenDelegate: SliverChildListDelegate([
                        Devices(),
                        Devices(),
                        Devices(),
                        Devices(),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFloatingActionButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// double temeprature = decodeData['main']['temp'];
//     int condition = decodeData['weather'][0]['id'];
//     String cityName = decodeData['name'];
