import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({this.onTap, this.selectedIndex = 0});

  final int selectedIndex;
  final Function(int) onTap;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
                    Icons.home_outlined,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                  ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  )
                : Icon(Icons.info_outline, color: Colors.grey),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Icon(Icons.settings_outlined, color: Colors.white)
                : Icon(
                    Icons.settings_outlined,
                    color: Colors.grey,
                  ),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.attribution_outlined), label: 'about us'),
        ],
      ),
    );
  }
}
