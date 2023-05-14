import 'package:flutter/material.dart';
import 'package:faster_tap/fastertappage.dart';

void main(List<String> args) {
  runApp(const FasterTap());
  
}

class FasterTap extends StatelessWidget{
  const FasterTap({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 205, 141, 211), useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const FasterTapState(),
    );
  }
}

class FasterTapState extends StatefulWidget{
  const FasterTapState({super.key});

  @override
  State<FasterTapState> createState() => FasterTapPage();
}
