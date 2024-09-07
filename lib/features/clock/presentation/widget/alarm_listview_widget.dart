import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/alarm_controller.dart';

class AlarmListviewWidget extends StatelessWidget {
  final String leading;
  final int index;

  AlarmListviewWidget({
    super.key,
    required this.leading,
    required this.index,
  });

  final AlarmController alarmController = Get.find();

  @override
  Widget build(BuildContext context) {
    log('Index: $index');
    return Card(
        elevation: 5,
        child: ListTile(
          leading: Text(
            leading,
            style: TextStyle(fontSize: 18),
          ),
          trailing: Obx(() {
            return Switch(
              activeColor: Colors.indigoAccent,
              value: alarmController.switchStates[index].value,
              onChanged: (_) {
                alarmController.toggleSwitch(index);
              },
            );
          }),
        ));
  }
}
