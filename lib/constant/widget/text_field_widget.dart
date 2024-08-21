import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  void Function(String)? onChanged;

  TextFieldWidget({
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: labelText,
            suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: suffixIcon)),
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
