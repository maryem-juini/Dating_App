import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget implements PreferredSizeWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white, size: 30),
        onPressed: () {
        },
      ),
      title: Image.asset('assets/logo.png', height: 150, width: 150),
      centerTitle: true,
      actions:[
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white, size: 30),
          onPressed: () {
          },
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); 
}