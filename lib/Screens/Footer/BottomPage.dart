
import 'package:dating_app/Screens/DatesPage.dart';
import 'package:dating_app/Screens/Footer/BottomIcon.dart';
import 'package:dating_app/Screens/HomePage.dart';
import 'package:dating_app/Screens/MessagesPage.dart';
import 'package:dating_app/Screens/ProfilePage.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatelessWidget {
  final int selectedIndex;

  const BottomPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:5),
      height: 80,
      color:Color.fromARGB(121, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomIcon(
              index: 0,
              selectedIndex: selectedIndex,
              icon: Icons.home_rounded,
              iconDescription: 'Home',
              destination: HomeScreen(),
            ),
            BottomIcon(
              index: 1,
              selectedIndex: selectedIndex,
              icon: Icons.message,
              iconDescription: 'Messages',
              destination: MessgesScreen(),
            ),
            BottomIcon(
              index: 2,
              selectedIndex: selectedIndex,
              icon: Icons.calendar_month,
              iconDescription: 'Dates',
              destination: DatesScreen(),
            ),
            BottomIcon(
              index: 3,
              selectedIndex: selectedIndex,
              icon: Icons.person,
              iconDescription: 'Profile',
              destination: ProfileScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
