import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  RxBool isSaveIconShow = false.obs;

  canSave() {
    if (descriptionController.value.text.isNotEmpty &&
        titleController.value.text.isNotEmpty) {
      isSaveIconShow.value = true;
    } else {
      isSaveIconShow.value = false;
    }
  }
}
