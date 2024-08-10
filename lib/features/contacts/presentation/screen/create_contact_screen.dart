import 'package:flutter/material.dart';

import '../../../../constant/text_constant.dart';

class CreateContactScreen extends StatelessWidget {
  const CreateContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
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
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ContactText.enterYourName),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
