import 'package:contact_book/constant/text_constant.dart';
import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';

class NewConversationWidget extends StatelessWidget {
  String name;

  NewConversationWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    TextEditingController msgcontroler = TextEditingController(text: name);

    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: MessegeText.newConversation,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: msgcontroler,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.add_circle),
                  labelText: MessegeText.labelText,
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              AppSpace.height520,
              Row(
                children: [
                  Icon(Icons.photo),
                  AppSpace.width5,
                  Icon(Icons.camera_alt_sharp),
                  AppSpace.width5,
                  Icon(Icons.add),
                  AppSpace.width5,
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  AppSpace.width5,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        fixedSize: const Size(25, 50),
                        // fixedSize: const Size(35, 55), // Updated button size
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    //   Container(
    //   height: height * 1,
    //   width: double.infinity,
    //   decoration: const BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.only(
    //           topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       children: [
    //         TextField(
    //           controller: msgcontroler,
    //           decoration: InputDecoration(
    //             enabledBorder: UnderlineInputBorder(
    //               borderSide: BorderSide(
    //                 color: Colors.indigoAccent,
    //                 width: 2,
    //               ),
    //             ),
    //             // suffix: Text(MessegeText.prefixTo),
    //             prefixIcon: Text(
    //               MessegeText.prefixTo,
    //               style: TextStyle(fontSize: 18),
    //             ),
    //             labelText: MessegeText.labelText,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
