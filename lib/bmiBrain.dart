import 'package:flutter/material.dart';
import 'dart:math';

class BmiBrain {
  final double weight;
  final double height;
  final int age;

  double _bmi;
  BmiBrain({@required this.weight, @required this.height, @required this.age});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You should start diet plan to reduce your weight in a Healthy way';
    } else if (_bmi >= 18.5) {
      return 'Congratulation! you are going in good Health. Keep it up';
    } else {
      return 'You should start diet plan to increase your weight in a Healthy way';
    }
  }
}
