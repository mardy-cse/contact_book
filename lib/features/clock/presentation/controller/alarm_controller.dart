import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AlarmController extends GetxController {
  final box = GetStorage();
  var light = false.obs;

  void toggleSwitch(int index) {
    switchStates[index].value = !switchStates[index].value;
  }

  List<Rx<Offset>> iconOffsets =
      List.generate(15, (index) => const Offset(0, 0).obs);
  List<Rx<Color>> buttonColor = List.generate(15, (index) => Colors.grey.obs);
  List<RxBool> switchStates = <RxBool>[];

  @override
  void onInit() {
    super.onInit();
    loadAlarms();
    switchStates = List.generate(alarmTimes.length, (index) => false.obs);
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
}
