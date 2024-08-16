import 'package:get/get.dart';

class ContactController extends GetxController {
  RxBool isGridView = false.obs;

  void toggleView() {
    isGridView.value = !isGridView.value;
  }
}
