import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double value;
  double isTemp;

  CircleProgress(this.value, this.isTemp);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    int maximumValue;
    if (isTemp == 0) {
      maximumValue = 50;
    } else if(isTemp ==1) {
      maximumValue = 100;
    } else if(isTemp == 2){
      maximumValue = 50;
    }else if (isTemp == 3){
      maximumValue = 100;
    }
    // Temp's max is 50, Humidity's max is 100

    // if(isTemp == 50){
    //   print('yha');
    // }else if (isTemp == 100){print('Noooo');}
    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Paint tempArc = Paint()
      ..strokeWidth = 14
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint humidityArc = Paint()
      ..strokeWidth = 14
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint soilMoistureArc = Paint()
      ..strokeWidth = 14
      ..color = Colors.indigo
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint lightDensityArc = Paint()
      ..strokeWidth = 14
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 14;
    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (value / maximumValue);

    Paint paint;
    if(isTemp == 0){
      paint = tempArc;
    }else if (isTemp == 1){
      paint = humidityArc;
    }else if (isTemp == 2){
      paint = soilMoistureArc;
    }else if (isTemp == 3){
      paint = lightDensityArc;
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false,paint,
        //isTemp ? tempArc : humidityArc
    );
  }
}
























//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class CircleProgress extends CustomPainter {
//   double value;
//   bool isTemp;
//
//   CircleProgress(this.value, this.isTemp);
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     int maximumValue =
//     isTemp ? 50 : 100; // Temp's max is 50, Humidity's max is 100
//
//     Paint outerCircle = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.grey
//       ..style = PaintingStyle.stroke;
//
//     Paint tempArc = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     Paint humidityArc = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//
//
//     Offset center = Offset(size.width / 2, size.height / 2);
//     double radius = min(size.width / 2, size.height / 2) - 14;
//     canvas.drawCircle(center, radius, outerCircle);
//
//     double angle = 2 * pi * (value / maximumValue);
//
//     canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
//         angle, false, isTemp ? tempArc : humidityArc);
//   }
// }
