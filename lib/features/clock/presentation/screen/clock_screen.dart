import 'package:contact_book/constant/app_space.dart';
import 'package:contact_book/constant/text_constant.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:contact_book/features/clock/presentation/screen/alarm_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/time_controller.dart';

class ClockScreen extends StatelessWidget {
  final TimeController timeController = Get.put(TimeController());

  ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: 'Digital clock'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 30, right: 15),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.indigoAccent),
              child: Obx(
                () => Center(
                  child: Text(
                    timeController.formattedTime.value,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          AppSpace.height30,
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 45, right: 10),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.indigoAccent)),
                  onPressed: () {
                    Get.to(AlarmScreen());
                  },
                  child: Text(
                    ClockText.alarm,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
