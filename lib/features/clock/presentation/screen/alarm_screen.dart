import 'package:contact_book/constant/text_constant.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/alarm_controller.dart';
import '../widget/alarm_bottom_sheet_widget.dart';
import '../widget/alarm_listview_widget.dart';

class AlarmScreen extends StatelessWidget {
  final AlarmController alarmcontroller = Get.put(AlarmController());

  List<String> time = [
    DateFormat('Hm').format(DateTime.now()),
    DateFormat('Hm').format(DateTime.now()),
    DateFormat('Hm').format(DateTime.now()),
    DateFormat('Hm').format(DateTime.now()),
    DateFormat('Hm').format(DateTime.now()),
  ] as List<String>;

  AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: ClockText.alarm),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return AlarmListviewWidget(
                    leading: time[index],
                    alarmController: alarmcontroller,
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.indigoAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.bottomSheet(AlarmBottomSheetWidget());
        },
      ),
    );
  }
}
