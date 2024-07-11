
import 'package:dating_app/HomePage.dart';
import 'package:dating_app/SwipeCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFF000000)),
      debugShowCheckedModeBanner: false,
      home: SwipeCardScreen(),
    );
  }
}

