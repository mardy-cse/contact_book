import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:contact_book/features/counter/presentation/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterApp extends StatelessWidget {
  CounterController counterController = Get.put(CounterController());
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: 'Counter App',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            return Text(
              counterController.count.toString(),
              style: TextStyle(fontSize: 24),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    counterController.count--;
                  },
                  child: Text('Decrement')),
              ElevatedButton(
                  onPressed: () {
                    counterController.count++;
                  },
                  child: Text('Increment')),
            ],
          )
        ],
      ),
    );
  }
}
