
import 'package:dating_app/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Component extends StatelessWidget {
  final String name;
  final String imagePath;
  final List<String> details;
  final double matchPercentage;

  Component({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.details,
    required this.matchPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: size.height * 0.01),
      width: size.width * 0.9,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.03,
                    left: size.height * 0.03,
                    right: size.height * 0.03,
                  ),
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("See profile",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07,
                      vertical: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: details
                            .map((detail) => Padding(
                                  padding:
                                      EdgeInsets.only(bottom: size.height * 0.01),
                                  child: TextStyles(data: detail),
                                ))
                            .toList(),
                      ),
                      Column(
                        children: [
                          SimpleCircularProgressBar(
                            valueNotifier: ValueNotifier(matchPercentage),
                            size: 70,
                            progressStrokeWidth: 10,
                            backStrokeWidth: 10,
                            backColor: Color.fromARGB(255, 4, 40, 41),
                            animationDuration: 3,
                            onGetText: (double value) {
                              TextStyle centerTextStyle = TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 105, 235, 240)
                                    .withOpacity(value * 0.01),
                              );
                              return Text(
                                '${value.toInt()}%',
                                style: centerTextStyle,
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextStyles(
                            data: 'Total match',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
