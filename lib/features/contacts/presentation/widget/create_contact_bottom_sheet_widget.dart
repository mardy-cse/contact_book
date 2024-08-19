import 'dart:developer';

import 'package:contact_book/constant/app_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../controller/contact_controller.dart';

class CreateContactBottomSheetWidget extends StatefulWidget {
  String title;
  String buttonName;
  String? name;
  String? number;
  String? email;
  String? address;
  String? fromWhere;

  CreateContactBottomSheetWidget({
    super.key,
    required this.title,
    required this.buttonName,
    this.name,
    this.number,
    this.email,
    this.address,
    this.fromWhere,
  });

  @override
  State<CreateContactBottomSheetWidget> createState() =>
      _CreateContactBottomSheetWidgetState();
}

class _CreateContactBottomSheetWidgetState
    extends State<CreateContactBottomSheetWidget> {
  ContactController contactController = Get.find<ContactController>();

  @override
  void initState() {
    super.initState();
    if (widget.fromWhere == 'Update') {
      contactController.nameController.text = widget.name ?? '';
      contactController.numberController.text = widget.number ?? '';
      contactController.emailController.text = widget.email ?? '';
      contactController.addressController.text = widget.address ?? '';
    } else {
      contactController.nameController.clear();
      contactController.numberController.clear();
      contactController.emailController.clear();
      contactController.addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: height * 1,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    // ContactText.edit,
                    widget.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(ContactIcon.person3Icon),
                      ),
                      AppSpace.height20,
                      TextField(
                        controller: contactController.nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.indigoAccent)),
                            prefixIcon: Icon(Icons.person),
                            labelText: ContactText.enterYourName),
                      ),
                      AppSpace.height15,
                      TextField(
                        controller: contactController.numberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.indigoAccent),
                            ),
                            prefixIcon: Icon(Icons.call),
                            labelText: ContactText.enterYourNumber),
                      ),
                      AppSpace.height15,
                      TextField(
                        controller: contactController.emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.indigoAccent),
                            ),
                            prefixIcon: Icon(Icons.email),
                            labelText: ContactText.enterYourEmail),
                      ),
                      AppSpace.height15,
                      TextField(
                        controller: contactController.addressController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.indigoAccent),
                            ),
                            prefixIcon: Icon(Icons.location_on),
                            labelText: ContactText.enterYourAddress),
                      ),
                      AppSpace.height30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.indigoAccent,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                ContactText.cancel,
                                style: TextStyle(color: Colors.white),
                              )),
                          AppSpace.width50,
                          Container(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Colors.indigoAccent)),
                                onPressed: () async {
                                  if (widget.fromWhere == 'Update') {
                                    await contactController
                                        .updateContact(
                                      name:
                                          contactController.nameController.text,
                                      number: contactController
                                          .numberController.text,
                                      email: contactController
                                          .emailController.text,
                                      address: contactController
                                          .addressController.text,
                                    )
                                        .then((value) {
                                      Navigator.pop(context);
                                      log('Update Contact');
                                    });
                                  } else {
                                    print('SaveTapped');
                                    print(
                                        'Name: ${contactController.nameController.text}');
                                    if (contactController.nameController.text !=
                                            '' &&
                                        contactController
                                                .numberController.text !=
                                            '') {
                                      await contactController
                                          .saveContact(
                                        name: contactController
                                            .nameController.text,
                                        number: contactController
                                            .numberController.text,
                                        email: contactController
                                            .emailController.text,
                                        address: contactController
                                            .addressController.text,
                                      )
                                          .then((value) {
                                        log('Contact Saved');
                                        Navigator.pop(context);
                                      });
                                    }
                                  }
                                },
                                // async {
                                //   if (contactController.nameController.text !=
                                //           '' &&
                                //       contactController.numberController.text !=
                                //           '') {
                                //     await contactController.saveContact(
                                //       name:
                                //           contactController.nameController.text,
                                //       number: contactController
                                //           .numberController.text,
                                //       email: contactController
                                //           .emailController.text,
                                //       address: contactController
                                //           .addressController.text,
                                //     );
                                //     Navigator.pop(context);
                                //   }
                                // },
                                child: Text(
                                  widget.buttonName,
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
