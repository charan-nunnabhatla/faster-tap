import 'package:flutter/material.dart';
import 'package:faster_tap/fastertappage.dart';
import 'package:faster_tap/variables.dart';

void main(List<String> args) {
  runApp(FasterTap());
  
}

class FasterTap extends StatelessWidget{
  FasterTap({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FasterTapState(),
    );
  }
}

class FasterTapState extends StatefulWidget{
  FasterTapState({super.key});

  @override
  State<FasterTapState> createState() => FasterTapPage();
}
