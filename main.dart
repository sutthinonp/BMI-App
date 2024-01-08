import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BMI.dart';
import 'bmi_result.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BMI()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputDataForm(),
    );
  }
}

class InputDataForm extends StatelessWidget {
  InputDataForm({Key? key}) : super(key: key);
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              controller: weightController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  isDense: true,
                  labelText: 'น้ำหนัก',
                  hintText: 'กรอกน้ำหนัก (กิโลกรัม)',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  floatingLabelStyle: const TextStyle(fontSize: 16),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 152, 121, 11),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              controller: heightController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  isDense: true,
                  labelText: 'ส่วนสูง',
                  hintText: 'กรอกส่วนสูง (เซ็นติเมตร)',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  floatingLabelStyle: const TextStyle(fontSize: 16),
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 152, 121, 11),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              context.read<BMI>().setData(double.parse(weightController.text),
                  double.parse(heightController.text)),
              context.read<BMI>().calBMI(),
              context.read<BMI>().getAdvise(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiResult()),
              )
            },
            child: Text(" คำนวณ BMI "),
          )
        ],
      )),
    );
  }
}
