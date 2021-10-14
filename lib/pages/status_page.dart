import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/widgets/circle_progress.dart';
import 'package:green_house/widgets/constants.dart';


class StatusPage extends StatefulWidget {

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final databeseReference = FirebaseDatabase.instance.reference();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;
  Animation<double> soilMoistureAnimation;
  Animation<double> lightDensityAnimation;

  @override
  void initState() {
    super.initState();
    databeseReference.child('Uno').once().then((DataSnapshot snapshot) {
      double temp = snapshot.value['Temp']['Data'];
      double humidity = snapshot.value['Humidity']['Data'];
      double soilMoi = snapshot.value['SoilMoiture']['Data'];
      double lightDens = snapshot.value['LightDens']['Data'];

      // double temp = 55.02;
      // double humidity = 70.00;
      print('this is $temp');
      print('this is $humidity');
      isLoading = true;
      _DashbordInit(temp, humidity,soilMoi,lightDens);
    });
  }

  _DashbordInit(double temp, double humid,double soilMoi,double lightDens) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    tempAnimation =
        Tween<double>(begin: -50, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
    humidityAnimation =
        Tween<double>(begin: 0, end: humid).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
    soilMoistureAnimation =
    Tween<double>(begin: 0, end: soilMoi).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
    lightDensityAnimation =
    Tween<double>(begin: 0, end: lightDens).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Center(
            child: isLoading
                ? GridView.custom(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ), childrenDelegate: SliverChildListDelegate([
              StatusCustomPaint(
                widgetAnimation: tempAnimation,
                widgetText: Text(' Air Temperature'),
                textIcon: Text(
                  '°C',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                paintState: 0,
              ),
              StatusCustomPaint(
                  widgetAnimation: humidityAnimation,
                  widgetText: Text('Humidity'),
                  textIcon: Text(
                    '%',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  paintState: 1),
              StatusCustomPaint(
                widgetAnimation: soilMoistureAnimation,
                widgetText: Text('Soil Moisture'),
                textIcon: Text(
                  '°C',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                paintState: 2,
              ),
              StatusCustomPaint(
                  widgetAnimation: lightDensityAnimation,
                  widgetText: Text('Light density'),
                  textIcon: Text(
                    '%',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  paintState: 3),
            ]) )

                : Text(
                    'Loading...',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}

class StatusCustomPaint extends StatelessWidget {
  StatusCustomPaint(
      {this.widgetText, this.widgetAnimation, this.textIcon, this.paintState});
  final Text widgetText;
  final Text textIcon;
  final double paintState;
  final Animation<double> widgetAnimation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: CustomPaint(
        foregroundPainter: CircleProgress(widgetAnimation.value, paintState),
        child: Container(
          width: 180,
          height: 180,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widgetText,
                Text(
                  '${widgetAnimation.value.toInt()}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                textIcon
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//${tempAnimation.value.toInt()}
// toIntText(

// CustomPaint(
// foregroundPainter:
// CircleProgress(humidityAnimation.value, false),
// child: Container(
// width: 200,
// height: 200,
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Text('Humidity'),
// Text(
// '${humidityAnimation.value.toInt()}',
// style: TextStyle(
// fontSize: 50, fontWeight: FontWeight.bold),
// ),
// Text(
// '%',
// style: TextStyle(
// fontSize: 20, fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// ),
// )



















//
