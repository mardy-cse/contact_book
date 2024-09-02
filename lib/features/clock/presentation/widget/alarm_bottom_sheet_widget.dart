import 'package:contact_book/constant/app_space.dart';
import 'package:contact_book/constant/text_constant.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/alarm_controller.dart';

class AlarmBottomSheetWidget extends StatefulWidget {
  AlarmBottomSheetWidget({super.key});

  @override
  State<AlarmBottomSheetWidget> createState() => _AlarmBottomSheetWidgetState();
}

class _AlarmBottomSheetWidgetState extends State<AlarmBottomSheetWidget> {
  TextEditingController timeController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.find<AlarmController>();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          height: height * 1,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomAppbarWidget(appBarTitle: 'new alarm'),
              AppSpace.height30,
              Text(
                ClockText.select,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              AppSpace.height20,
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.indigoAccent)),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input,
                    );
                    if (pickedTime != null) {
                      setState(() {
                        timeController.text =
                            '${pickedTime.hour}:${pickedTime.minute}';
                      });

                      print('${pickedTime.hour}:${pickedTime.minute}');
                    }
                  },
                  child: Icon(
                    Icons.access_time_sharp,
                    color: Colors.white,
                  )),
              AppSpace.height20,
              SizedBox(
                height: 50,
                width: 80,
                child: TextField(
                  controller: timeController,
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              AppSpace.height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.indigoAccent)),
                      onPressed: () {
                        if (timeController.text.isNotEmpty) {
                          alarmController.addTime(timeController.text);
                        } else {
                          print('no time selected');
                        }
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                  AppSpace.width20,
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.indigoAccent)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
