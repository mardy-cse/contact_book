import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/alarm_controller.dart';

class AlarmListviewWidget extends StatelessWidget {
  final AlarmController alarmController;
  final String leading;
  final int index;

  const AlarmListviewWidget({
    super.key,
    required this.leading,
    required this.index,
    required this.alarmController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: ListTile(
          leading: Text(
            leading,
            style: TextStyle(fontSize: 18),
          ),
          trailing: Obx(() => ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  alarmController.buttonColor[index].value,
                ),
              ),
              onPressed: () => alarmController.changeColor(index),
              child: Obx(
                () => Transform.translate(
                  offset: alarmController.iconOffsets[index].value,
                  child: const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                  ),
                ),
              ))),
        ));
  }
}
