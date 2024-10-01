import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TestMainScreen extends StatefulWidget {
  const TestMainScreen({super.key, required this.dif});

  final int dif;

  @override
  State<TestMainScreen> createState() => _TestMainScreenState(dif: dif);
}

class _TestMainScreenState extends State<TestMainScreen> {
  final int dif;
  var random = Random();
  int? randomNum;
  int _counter = 5;
  int stopWatch = 0;
  int degree = 1;
  _TestMainScreenState({required this.dif});

  @override
  void initState() {
    super.initState();
    _startCountDown();
    _updateDegree();
  }

  _updateDegree() {
    for (int i = 0; i < dif; i++) {
      degree *= 10;
    }
    randomNum = randomNumber();
  }

  _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  int randomNumber() {
    double rDouble = random.nextDouble() * 0.9 + 0.1;
    int randNum = (rDouble * degree).toInt();
    return randNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _counter > 0
          ? Center(
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 40),
              ),
            )
          : Center(
              child: Column(
                children: [
                  Text(
                    '$randomNum',
                    style: TextStyle(fontSize: 40),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        randomNum = randomNumber();
                      });
                    },
                    child: Text(
                      '난수생성',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      maximumSize: Size.fromHeight(150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
