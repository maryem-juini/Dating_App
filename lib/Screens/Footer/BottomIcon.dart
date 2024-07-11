import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String iconDescription;
  final Widget destination;
  const BottomIcon({super.key, required this.index, required this.selectedIndex, required this.icon, required this.iconDescription, required this.destination});

  @override
  Widget build(BuildContext context) {
    Color chosenColor() {
      if (selectedIndex == index) {
        return Colors.white;
      } else {
        return Colors.white.withOpacity(0.5);
      }
    }
    return GestureDetector(
      onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: chosenColor(),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            iconDescription,
            style: TextStyle(
              color: chosenColor(),
            ),
          ),
        ],
      ),
    );
  }
}