import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BMI.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({Key? key}) : super(key: key);

  Widget getImage(double _bmi) {
    if (_bmi > 30.0) {
      return Image.asset('assets/01.jpg');
    } else if (_bmi >= 25.0) {
      return Image.asset('assets/02.jpg');
    } else if (_bmi >= 23.0) {
      return Image.asset('assets/03.jpg');
    } else if (_bmi >= 18.5) {
      return Image.asset('assets/04.jpg');
    } else {
      return Image.asset('assets/05.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BMI>(
      builder: (context, bmi, _) {
        return Scaffold(
          appBar: AppBar(title: Text("BMI Result")),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("น้ำหนัก: ${bmi.weight} กิโลกรัม"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("ส่วนสูง: ${bmi.height}  เซ็นติเมตร"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("BMI : ${bmi.bmi}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("BMI Body : ${bmi.getAdvise()}"),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: getImage(bmi.bmi),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(" กลับ "))
              ],
            ),
          ),
        );
      },
    );
  }
}
