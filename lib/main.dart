import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dice app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  var leftDiceNUmber = 1;
  var rightDiceNUmber = 1;

  void changeDice() {
    setState(() {
      leftDiceNUmber = Random().nextInt(6) + 1;
      rightDiceNUmber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Center(child: Text("DiceApp")),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'Click Any Dice &  It Will Randomly Come',
                style: GoogleFonts.poppins(),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          changeDice();
                        },
                        child: Image.asset('images/dice$leftDiceNUmber.png'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          changeDice();
                        },
                        child: Image.asset('images/dice$rightDiceNUmber.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
