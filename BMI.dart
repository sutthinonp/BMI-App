import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BMI with ChangeNotifier, DiagnosticableTreeMixin {
  double _weight = 0;
  double _height = 0;
  double _bmi = 0;

  double get weight => _weight;
  double get height => _height;
  double get bmi => _bmi;

  void setData(double weight, double height) {
    _weight = weight;
    _height = height;
    notifyListeners();
  }

  void calBMI() {
    _bmi = _weight / ((_height / 100) * (_height / 100));
    notifyListeners();
  }

  String getAdvise() {
    if (_bmi > 30.0) {
      return 'อ้วนมาก';
    } else if (_bmi >= 25.0) {
      return 'อ้วน';
    } else if (_bmi >= 23.0) {
      return 'น้ำหนักเกินมาตรฐาน';
    } else if (_bmi >= 18.5) {
      return 'น้ำหนักสมส่วน';
    } else {
      return 'น้ำหนักต่ำกว่าเกณฑ์';
    }
  }
}
