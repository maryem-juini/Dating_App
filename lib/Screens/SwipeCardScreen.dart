
import 'package:dating_app/Screens/Components/Card.dart';
import 'package:dating_app/Screens/Components/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dating_app/Providers/GirlProvider.dart';

class SwipeCardScreen extends ConsumerStatefulWidget {
  const SwipeCardScreen({super.key});

  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends ConsumerState<SwipeCardScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final girls = ref.watch(girlsProvider);

    return Scaffold(
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
                        inviteGirl(ref, index);
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
    );
  }
}
