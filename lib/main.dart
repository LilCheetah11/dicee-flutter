import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber = 4;
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        diceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/dice$diceNumber.png'),
                    ))),
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        changeDiceFace();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('images/dice$leftDiceNumber.png'),
                      ))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        changeDiceFace();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('images/dice$rightDiceNumber.png'),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
