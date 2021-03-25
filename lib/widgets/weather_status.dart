import 'package:flutter/material.dart';

class WeatherStatus extends StatefulWidget {
  WeatherStatus({Key key}) : super(key: key);

  @override
  _WetherStatusState createState() => _WetherStatusState();
}

class _WetherStatusState extends State<WeatherStatus> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: size.height * 0.4,
        width: size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 25, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text('Date and time')),
              Row(
                children: [
                  Text('Weather Data'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Weather Data'),
                ],
              ),
              Text('Other data')
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
