import 'package:faster_tap/main.dart';
import 'package:flutter/material.dart';

class FasterTapPage extends State<FasterTapState> {
  double x_ratio = 100;
  double y_ratio = 100;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // x_ratio = height / 2;
    // y_ratio = height / 2;
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                x_ratio++;
                y_ratio--;
              });
            },
            child: Container(
              color: Color.fromARGB(255, 216, 139, 139),
              height: x_ratio,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                x_ratio--;
                y_ratio++;
              });
            },
            child: Container(
              color: Color.fromARGB(255, 158, 231, 215),
              height: y_ratio,
            ),
          ),
        ],
      ),
    );
  }
}
