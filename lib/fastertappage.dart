import 'package:faster_tap/main.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FasterTapPage extends State<FasterTapState> {
  int count = 0;
  // double height = 0;
  // double height = ui.window.physicalSize.height;

  double tall(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  late double xRatio = tall(context) / 2;
  late double yRatio = tall(context) / 2;
  int step = 20;
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                xRatio += step;
                yRatio -= step;
                count++;
              });
            },
            child: Container(
              color: Color.fromARGB(255, 216, 139, 139),
              height: xRatio,
              child: Center(child: Text('${xRatio.toInt()}')),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xRatio -= step;
                yRatio += step;
                count++;
              });
            },
            child: Container(
              color: Color.fromARGB(255, 158, 231, 215),
              height: yRatio,
              child: Center(child: Text('${yRatio.toInt()}')),
            ),
          ),
        ],
      ),
    );
  }
}
