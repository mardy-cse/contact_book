import 'package:contact_book/features/clock/presentation/controller/alarm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmListviewWidget extends StatelessWidget {
  final AlarmController alarmController;
  final String leading;
  final int index;

  AlarmListviewWidget({
    super.key,
    required this.leading,
    required this.alarmController,
    required this.index,
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
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                  ),
                ),
              ))),
        ));
  }
}
