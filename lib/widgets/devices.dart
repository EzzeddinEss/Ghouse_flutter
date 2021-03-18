import 'package:flutter/material.dart';
//import 'package:flutter_switch/flutter_switch.dart';

class Devices extends StatefulWidget {
  Devices({Key key}) : super(key: key);

  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  bool isChecked = false;
  int containerState = 0;
  Decoration containerBackColor = BoxDecoration(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            _onTileClicked();
            _onTab(true);
          },
          child: Container(
            height: 200,
            width: 100,
            decoration: containerBackColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Switch(value: isChecked, onChanged: _onTab),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTab(bool val) {
    {
      setState(() {
        if (isChecked == val) {
          isChecked = false;
          print('$val');
        } else {
          isChecked = true;
        }
      });
    }
  }

  void _onTileClicked() {
    setState(() {
      if (containerState == 1) {
        containerState = 0;
        containerBackColor = BoxDecoration(color: Colors.grey);
      } else {
        containerState = 1;
        containerBackColor = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF569DFA),
              Color(0xFF3876F6),
            ],
          ),
        );
      }
    });
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
