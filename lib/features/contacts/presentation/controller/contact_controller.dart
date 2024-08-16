import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxBool isGridView = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void toggleView() {
    isGridView.value = !isGridView.value;
  }

  Future saveContact({
    required String name,
    required String number,
    String? email,
    String? address,
  }) async {
    await FirebaseFirestore.instance.collection('Contacts').doc(name).set({
      'name': nameController.text.toString(),
      'number': numberController.text.toString(),
      'email': emailController.text.toString(),
      'address': addressController.text.toString()
    }).then(
      (value) {
        nameController.clear();
        numberController.clear();
        emailController.clear();
        addressController.clear();
      },
    );
  }
}
