import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmController extends GetxController {
  // List<Rx<Color>> iconColor = List.generate(5, (index) => Colors.white.obs);
  List<Rx<Offset>> iconOffsets = List.generate(5, (index) => Offset(0, 0).obs);
  List<Rx<Color>> buttonColor = List.generate(5, (index) => Colors.grey.obs);

  // var alarmText = ''.obs;
  // TextEditingController alarmController;
  //
  // AlarmController() : alarmController = TextEditingController();
  //
  // void setTime(String time) {
  //   alarmText.value = time;
  //   alarmController.text = time;
  // }

  void changeColor(int index) {
    if (iconOffsets[index].value == Offset(0, 0)) {
      iconOffsets[index].value = Offset(20, 0); // Move right
      buttonColor[index].value = Colors.indigo; // Change button color
    } else {
      iconOffsets[index].value = Offset(0, 0); // Reset to original position
      buttonColor[index].value = Colors.grey; // Reset button color
    }
  }
}
