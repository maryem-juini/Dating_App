import 'package:dating_app/Card.dart';
import 'package:dating_app/TextStyle.dart';
import 'package:flutter/material.dart';

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
  final List<Map<String, dynamic>> girls = [
    {
      'name': 'Teresa Evans',
      'imagePath': 'assets/girl1.png',
      'details': ['Mini Golf ⛳', 'Tonight 7:30 PM', 'Madeira Beach Park'],
      'matchPercentage': 81.0,
      'invited': false,
    },
    {
      'name': 'Emily Johnson',
      'imagePath': 'assets/girl2.jpeg',
      'details': ['Dinner 🍽️', 'Tomorrow 8:00 PM', 'Downtown Restaurant'],
      'matchPercentage': 65.0,
      'invited': false,
    },
    {
      'name': 'Sophia Brown',
      'imagePath': 'assets/girl3.jpg',
      'details': ['Coffee ☕', 'Saturday 10:00 AM', 'Central Park Cafe'],
      'matchPercentage': 75.0,
      'invited': false,
    },
    {
      'name': 'Jessica White',
      'imagePath': 'assets/girl4.jpg',
      'details': ['Movie Night 🎬', 'Friday 9:00 PM', 'City Cinema'],
      'matchPercentage': 60.0,
      'invited': false,
    },
    {
      'name': 'Olivia Green',
      'imagePath': 'assets/girl5.jpg',
      'details': ['Hiking 🌲', 'Sunday 7:00 AM', 'Mountain Trail'],
      'matchPercentage': 70.0,
      'invited': false,
    },
  ];

  void onInvite(int index) {
    setState(() {
      girls[index]['invited'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MaterialApp(
      title: 'Dating App',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFF000000)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF000000),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date options",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text('Exit',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  itemCount: girls.length,
                  itemBuilder: (BuildContext context, int index) {
                    final girl = girls[index];
                    return GestureDetector(
                      onVerticalDragEnd: (details) {
                        if (details.primaryVelocity! < 0) {
                          onInvite(index);
                        }
                      },
                      child: Column(
                        children: [
                          girl['invited']
                              ? Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.5,
                                      width: size.width * 0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                            SizedBox(height: 10),
                                            TextStyles(
                                              data: 'Invited',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Component(
                                  name: girl['name'],
                                  imagePath: girl['imagePath'],
                                  details: girl['details'],
                                  matchPercentage: girl['matchPercentage'],
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          if (!girl['invited'])
                            Column(
                              children: [
                                Icon(
                                  Icons.keyboard_double_arrow_up_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                TextStyles(data: 'Swipe up to invite')
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
