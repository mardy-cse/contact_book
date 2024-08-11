import 'package:contact_book/constant/app_space.dart';
import 'package:flutter/material.dart';

import '../../../../constant/text_constant.dart';

class CreateContactScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    ContactText.newContact,
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
                        controller: nameController,
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
                        controller: numberController,
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
                        controller: emailController,
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
                        controller: addressController,
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
                                onPressed: () {
                                  if (nameController.text != '' &&
                                      numberController.text != '') {
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
