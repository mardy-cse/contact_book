import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
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
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.indigoAccent),
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
    );
  }
}
