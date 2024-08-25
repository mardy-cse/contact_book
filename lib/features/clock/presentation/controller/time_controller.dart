import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeController extends GetxController {
  var formattedTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        formattedTime.value = DateFormat('h:mm:ss a').format(DateTime.now());
      },
    );
  }
}
