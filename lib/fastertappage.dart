import 'package:faster_tap/main.dart';
import 'package:flutter/material.dart';

class FasterTapPage extends State<FasterTapState> {
  int count = 0;
  late double xRatio = tall(context) / 2;
  late double yRatio = tall(context) / 2;
  int step = 10;
  bool done = false;
  bool xWon = false;
  bool yWon = false;
  // double height = 0;
  // double height = ui.window.physicalSize.height;

  double tall(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  void checkHeight(double x, double y) {
    if (x > y) {
      xWon = true;
    } else {
      yWon = true;
    }

    if (x <= 30 || y <= 30) {
      setState(() {
        done = true;
        if (done) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: xWon ? const Text('Player 1 Won') : const Text('Player 2 Won'),
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
                        child: const Text('Done'))
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
                color: Color.fromARGB(255, 115, 207, 172),
                height: xRatio,
                child: const Center(
                    child: RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    'Player 1',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'arial',
                        color: Color.fromARGB(255, 120, 98, 182)),
                  ),
                )),
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
                color: Color.fromARGB(255, 183, 145, 219),
                height: yRatio,
                child: const Center(
                    child: Text(
                  'Player 2',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'arial',
                      color: Color.fromARGB(255, 211, 24, 218)),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
