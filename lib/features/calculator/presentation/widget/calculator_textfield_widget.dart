import 'package:flutter/material.dart';

class CalculatorTextfieldWidget extends StatelessWidget {
  String num;
  TextEditingController? controller;
  final bool readOnly;

  CalculatorTextfieldWidget({
    super.key,
    required this.controller,
    required this.num,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
          hintText: num,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
