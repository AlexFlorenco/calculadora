import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/material.dart';

class CalculadoraController with ChangeNotifier {
  CalculadoraController._();

  static final instance = CalculadoraController._();

  String calc = "";

  void addDigit(String digit) {
    calc += digit;
    notifyListeners();
  }

  void calculate() {
    calc = eval(calc.replaceAll('x', '*').replaceAll(',', '.'))
        .toString()
        .replaceAll('.', ',');
    notifyListeners();
  }

  void clear() {
    calc = '';
    notifyListeners();
  }
}
