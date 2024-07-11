import 'package:flutter/material.dart';

class TextStyles extends StatelessWidget {
  final String data;
  const TextStyles({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ));
  }
}