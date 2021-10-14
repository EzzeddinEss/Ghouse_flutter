import 'package:flutter/material.dart';
import 'package:green_house/models/green_house_icons.dart';


class Devices extends StatefulWidget {
  Devices({Key key}) : super(key: key);

  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {

  bool isChecked = false;

  Decoration containerBackColor = BoxDecoration(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            _onTab(true);
          },
          child: Container(
            height: size.height * 0.8,
            width: size.width * 0.2,
            decoration: containerBackColor,
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(padding: EdgeInsets.only(top: 15, left: 10),
                          child: Icon(MyFlutterApp.air_conditioner,size: 30,),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 50),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Switch(value: isChecked, onChanged: _onTab),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTab(val) {
    {
      setState(() {
        isChecked = !isChecked;
        isChecked == false
            ? containerBackColor = BoxDecoration(color: Colors.grey)
            : containerBackColor = BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF569DFA),
                  Color(0xFF3876F6),
                ],
              ));
      });
    }
  }
}

// FlutterSwitch(
//                           value: isChecked,
//                           onToggle: (value) {
//                             setState(
//                               () {
//                                 isChecked = value;
//                               },
//                             );
//                           },
//                           height: 25.0,
//                           width: 55.0,
//                           padding: 4.0,
//                           toggleSize: 25.0,
//                           borderRadius: 10.0,
//                           activeColor: Colors.green,
//                         ),
