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
  int? randomNum1;
  int? randomNum2;
  int _counter = 5;
  int stopWatch = 0;
  int degree = 1;

  int testCount = 0;
  int questionCount = 0;

  int rightCount = 0;
  int wrongCount = 0;
  _TestMainScreenState({required this.dif});

  var submitController = TextEditingController();

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
    randomNum1 = randomNumber();
    randomNum2 = randomNumber();
  }

  _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
          _updateStopWatch();
          _checkQuestionCount();
        }
      });
    });
  }

  _checkQuestionCount() {
    Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
      if (questionCount >= 10) {
        stopWatch = 0;
        questionCount = 0;
        testCount++;
        randomNum1 = randomNumber();
        randomNum2 = randomNumber();
      }
    });
  }

  _updateStopWatch() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (stopWatch < 30) {
          stopWatch++;
        } else {
          timer.cancel();
          if (testCount < 5) {
            testCount++;
            stopWatch = 0;
            _updateStopWatch();
            randomNum1 = randomNumber();
            randomNum2 = randomNumber();
          } else {
            return;
          }
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
      backgroundColor: Colors.white,
      appBar: _counter > 0
          ? AppBar(
              backgroundColor: Colors.white,
              leading: Text(''),
            )
          : AppBar(
              leading: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('$stopWatch'),
              ),
              backgroundColor: Colors.white,
            ),
      body: _counter > 0
          ? Center(
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 40),
              ),
            )
          : testCount < 5
              ? Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Q. ${questionCount + 1}',
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$randomNum1',
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$randomNum2',
                          style: TextStyle(fontSize: 40),
                        ),
                        TextFormField(
                          controller: submitController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            questionCount++;
                            if (randomNum1! + randomNum2! ==
                                int.parse(submitController.text)) {
                              rightCount++;
                            } else {
                              wrongCount++;
                            }
                            setState(() {
                              randomNum1 = randomNumber();
                              randomNum2 = randomNumber();
                              submitController = TextEditingController();
                            });
                          },
                          child: Text(
                            '제출하기',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            maximumSize: Size.fromHeight(150),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      '결과 확인하기',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      '정확도 : ${(rightCount + wrongCount == 0 ? 0 : ((rightCount / (rightCount + wrongCount)) * 100).round())}%',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
    );
  }
}
