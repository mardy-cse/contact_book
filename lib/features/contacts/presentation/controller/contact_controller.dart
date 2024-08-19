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

  Future<void> updateContact({
    required String name,
    required String number,
    String? email,
    String? address,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('Contacts').doc(name).update({
        'name': name,
        'number': number,
        'email': email,
        'address': address,
      });
      nameController.clear();
      numberController.clear();
      emailController.clear();
      addressController.clear();
    } catch (e) {
      // Handle any errors here
      print("Failed to update contact: $e");
    }
  }
}

// updateContact(
//     {required String name,
//     required String number,
//     required String email,
//     required String address}) {}
//  }
