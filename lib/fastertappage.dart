import 'package:faster_tap/main.dart';
import 'package:flutter/material.dart';

class FasterTapPage extends State<FasterTapState> {
  int count = 0;
  double height = 0;
  double xRatio = 0;
  double yRatio = 0;
  @override
  Widget build(BuildContext context) {
    setState(() {
      height = MediaQuery.of(context).size.height;
      xRatio = height / 2;
      yRatio = height / 2;
    });
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                xRatio += 5;
                yRatio -= 5;
                count++;
              });
            },
            child: Container(
              color: Color.fromARGB(255, 216, 139, 139),
              height: xRatio,
              child: Center(child: Text('$count')),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xRatio -= 5;
                yRatio += 5;
                count++;
              });
            },
            child: Container(
              color: Color.fromARGB(255, 158, 231, 215),
              height: yRatio,
            ),
          ),
        ],
      ),
    );
  }
}
