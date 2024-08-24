import 'package:flutter/material.dart';

class CalcaulatorElevetedbuttonWidget extends StatelessWidget {
  final VoidCallback action;
  final String buttonName;

  CalcaulatorElevetedbuttonWidget({
    Key? key,
    required this.action,
    required this.buttonName,
  }) : super(key: key);

  // const CalcaulatorElevetedbuttonWidget({
  //   super.key,
  //   required this.buttonName,
  //   required this.action,
  // });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.indigoAccent)),
      onPressed: action,
      child: Text(buttonName, style: TextStyle(color: Colors.white)),
    );
  }
}
