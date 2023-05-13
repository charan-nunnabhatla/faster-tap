import 'package:faster_tap/main.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FasterTapPage extends State<FasterTapState> {
  int count = 0;
  late double xRatio = tall(context) / 2;
  late double yRatio = tall(context) / 2;
  int step = 40;
  bool done = false;
  // double height = 0;
  // double height = ui.window.physicalSize.height;

  double tall(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  void checkHeight(double x, double y) {
    if (x <= 30 || y <= 30) {
      setState(() {
        done = true;
        if (done) {
          showDialog(
            barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('You won'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            done = false;

                            xRatio = tall(context) / 2;
                            yRatio = tall(context) / 2;
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Done'))
                  ],
                );
              });
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          AbsorbPointer(
            absorbing: done,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  xRatio += step;
                  yRatio -= step;
                  checkHeight(xRatio, yRatio);
                  count++;
                });
              },
              child: Container(
                color: Color.fromARGB(255, 42, 189, 132),
                height: xRatio,
                // child: Center(child: Text('${xRatio.toInt()}')),
              ),
            ),
          ),
          AbsorbPointer(
            absorbing: done,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  xRatio -= step;
                  yRatio += step;
                  checkHeight(xRatio, yRatio);
                  count++;
                });
              },
              child: Container(
                color: Color.fromARGB(255, 168, 98, 235),
                height: yRatio,
                // child: Center(child: Text('${yRatio.toInt()}')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
