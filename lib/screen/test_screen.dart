import 'package:flutter/material.dart';
import 'package:test_app/screen/test_setting_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "테스트",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestSettingScreen(),
                        ));
                  },
                  child: Text(
                    '테스트 시작하기',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      maximumSize: Size.fromHeight(150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
