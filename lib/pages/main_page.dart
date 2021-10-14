import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/widgets/devices.dart';
import 'package:green_house/widgets/scroll_behavior.dart';
import 'package:green_house/widgets/weather_status.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherStatus(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        child: Container(
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // CustomFloatingActionButton()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}