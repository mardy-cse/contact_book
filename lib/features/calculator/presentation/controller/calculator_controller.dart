import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController result = TextEditingController();

  void add() {
    //double number1,number2,sum,mul,div,reset;
    double number1 = double.tryParse(num1.text) ?? 9.0;

    double number2 = double.tryParse(num2.text) ?? 0.0;
    double sum = (number1 + number2);
    result.text = 'Addition is: $sum';

    String result1 = 'Addition is: ${result.text}';
  }

  void sub() {
    double number1 = double.tryParse(num1.text) ?? 0.0;
    double number2 = double.tryParse(num2.text) ?? 0.0;
    double sub = (number1 - number2);
    result.text = 'Subtraction is: $sub';
  }

  void mul() {
    double number1 = double.tryParse(num1.text) ?? 0.0;
    double number2 = double.tryParse(num2.text) ?? 0.0;
    double mul = (number1 * number2);
    result.text = 'Multiplication is: $mul';
  }

  void div() {
    double number1 = double.tryParse(num1.text) ?? 0.0;
    double number2 = double.tryParse(num2.text) ?? 0.0;
    double div = (number1 / number2);
    result.text = 'Division is: $div';
  }

  void reset() {
    num1.clear();
    num2.clear();
    result.clear();
  }
}
