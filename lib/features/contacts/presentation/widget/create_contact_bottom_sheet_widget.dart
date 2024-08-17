import 'package:contact_book/constant/app_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../controller/contact_controller.dart';

class CreateContactBottomSheetWidget extends StatelessWidget {
  String edit;

  CreateContactBottomSheetWidget({super.key, required this.edit});

  @override
  ContactController contactController = Get.find<ContactController>();

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
                    edit,
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
                            width: 90,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Colors.indigoAccent)),
                                onPressed: () async {
                                  if (contactController.nameController.text !=
                                          '' &&
                                      contactController.numberController.text !=
                                          '') {
                                    await contactController.saveContact(
                                      name:
                                          contactController.nameController.text,
                                      number: contactController
                                          .numberController.text,
                                      email: contactController
                                          .emailController.text,
                                      address: contactController
                                          .addressController.text,
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  ContactText.save,
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
