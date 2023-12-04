import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> randomNumbers = [];
  int tappedButtonNumber = -1;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }

  void generateRandomNumbers() {
    final random = Random();
    randomNumbers = List.generate(15, (index) => random.nextInt(16));
  }

  void handleButtonTap(int number) {
    setState(() {
      tappedButtonNumber = number;
    });

    // Check if the tapped button's number matches the corresponding container's number
    if (randomNumbers[tappedButtonNumber] == tappedButtonNumber) {
      // Set the container's color to yellow
      randomNumbers[tappedButtonNumber] = -1; // Mark as matched
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Match!'),
          backgroundColor: Colors.yellow,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Matching Game'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            color: randomNumbers[index] == index ? Colors.yellow : Colors.blue,
            child: ElevatedButton(
              onPressed: () => handleButtonTap(index),
              child: Text('$index'),
            ),
          );
        },
      ),
    );
  }
}
