import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:green_house/pages/home_page.dart';
import 'package:green_house/pages/setting.dart';
import 'package:green_house/pages/status_page.dart';

import '../widgets/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({this.onTap, this.selectedIndex = 0});

  final int selectedIndex;
  final Function(int) onTap;

// }

// class _BottomNavBarState extends State<BottomNavBar> {

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Info',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 3: About us',
      style: optionStyle,
    )
  ];

  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(41, 34, 78, 1),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.yellow))),
      child: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(41, 34, 78, 1),
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Icon(
                    Icons.home,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
            label: 'home',
            // title: Container(
            //   height: 0,
            // ),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  )
                : Icon(Icons.info_outline, color: Colors.grey),
            label: 'Info',
            // title: Container(
            //   height: 0,
            // ),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Icon(Icons.settings_outlined, color: Colors.white)
                : Icon(
                    Icons.settings_outlined,
                    color: Colors.grey,
                  ),
            label: 'Setting',
            // title: Container(
            //   height: 0,
            // ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.attribution_outlined), label: 'about us'),
        ],
      ),
    );
  }
}
