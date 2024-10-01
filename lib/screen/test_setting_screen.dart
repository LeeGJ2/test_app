import 'package:flutter/material.dart';
import 'package:test_app/screen/test_main_screen.dart';

class TestSettingScreen extends StatefulWidget {
  const TestSettingScreen({super.key});

  @override
  State<TestSettingScreen> createState() => _TestSettingScreenState();
}

class _TestSettingScreenState extends State<TestSettingScreen> {
  int dif = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                '난이도 조절',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                dif.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (dif > 1) {
                        dif -= 1;
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.arrow_left_sharp),
                    iconSize: 50,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      if (dif < 8) {
                        dif += 1;
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.arrow_right_sharp),
                    iconSize: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestMainScreen(
                          dif: dif,
                        ),
                      ));
                },
                child: Text(
                  '시작하기',
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
      ),
    );
  }
}
