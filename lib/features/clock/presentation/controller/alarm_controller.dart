import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AlarmController extends GetxController {
  final box = GetStorage();

  List<Rx<Offset>> iconOffsets = <Rx<Offset>>[];
  List<Rx<Color>> buttonColor = <Rx<Color>>[];

  // List<Rx<Offset>> iconOffsets =
  //     List.generate(5, (index) => const Offset(0, 0).obs);
  // List<Rx<Color>> buttonColor = List.generate(5, (index) => Colors.grey.obs);

  @override
  void onInit() {
    super.onInit();
    loadAlarms();
  }

  ///For adding new time.
  var alarmTimes = <String>[].obs;

  ///reactive variable.
  void addTime(String time) {
    alarmTimes.add(time);
    saveAlarms();
  }

  void updateTime(int index, String newTime) {
    alarmTimes[index] = newTime;
    saveAlarms();
  }

  void saveAlarms() {
    box.write('alarms', alarmTimes.toList());
  }

  void loadAlarms() {
    var storedAlarms = box.read<List>('alarms');
    if (storedAlarms != null) {
      alarmTimes.assignAll(storedAlarms.map((e) => e.toString()));
    }
  }

  ///For changing color and shifting the icon.

  void changeColor(int index) {
    if (iconOffsets[index].value == const Offset(0, 0)) {
      iconOffsets[index].value = const Offset(20, 0); // Move right
      buttonColor[index].value = Colors.indigo; // Change button color
    } else {
      iconOffsets[index].value =
          const Offset(0, 0); // Reset to original position
      buttonColor[index].value = Colors.grey; // Reset button color
    }
  }
}
