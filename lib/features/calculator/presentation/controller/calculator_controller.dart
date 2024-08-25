import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  void add() {
    double number1 = double.parse(num1Controller.text);
    double number2 = double.parse(num2Controller.text);
    double sum = (number1 + number2);
    resultController.text = 'Addition is: $sum';

    String result1 = 'Addition is: ${resultController.text}';
  }

  void sub() {
    double number1 = double.parse(num1Controller.text);
    double number2 = double.parse(num2Controller.text);
    double sub = (number1 - number2);
    resultController.text = 'Subtraction is: $sub';
  }

  void mul() {
    double number1 = double.parse(num1Controller.text);
    double number2 = double.parse(num2Controller.text);
    double mul = (number1 * number2);
    resultController.text = 'Multiplication is: $mul';
  }

  void div() {
    double number1 = double.parse(num1Controller.text);
    double number2 = double.parse(num2Controller.text);
    double div = (number1 / number2);
    resultController.text = 'Division is: $div';
  }

  void reset() {
    num1Controller.clear();
    num2Controller.clear();
    resultController.clear();
  }
}
