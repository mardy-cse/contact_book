import 'package:contact_book/constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constant/widget/custom_appbar_widget.dart';
import '../widget/messege_listview_widget.dart';
import '../widget/new_conversation_widget.dart';

class MessegeScreen extends StatelessWidget {
  List<String> msgIcon = [
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
    'assets/icon/contacts/person (2).png',
  ];
  List<String> name = [
    'mim',
    'minal',
    'mahi',
    'aysha',
    'abrar',
    'roja',
    'riya',
    'ripa',
    'nafu',
    'susmi',
    'sajid',
    'romij',
  ];

  List<DateTime> time = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    // DateTime.now().subtract(Duration(minutes: 5)),
    // DateTime.now().subtract(Duration(minutes: 10)),
    // DateTime.now().subtract(Duration(hours: 1)),
    // DateTime.now().subtract(Duration(hours: 2)),
    // DateTime.now().subtract(Duration(days: 1)),
    // DateTime.now().subtract(Duration(days: 2)),
    // DateTime.now().subtract(Duration(days: 3)),
    // DateTime.now().subtract(Duration(days: 4)),
    // DateTime.now().subtract(Duration(days: 5)),
    // DateTime.now().subtract(Duration(days: 6)),
    // DateTime.now().subtract(Duration(days: 7)),
  ];

  MessegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: MessegeText.title,
      ),
      // AppBar(
      //   backgroundColor: Colors.indigoAccent,
      //   leading: DrawerButton(
      //     color: Colors.white,
      //   ),
      //   title: Center(
      //     child: Text(
      //       MessegeText.title,
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   ),
      //   actions: [
      //     Icon(
      //       Icons.search,
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          String formattedTime = DateFormat('hh:mm a').format(time[index]);
          return GestureDetector(
            onTap: () {
              Get.to(
                NewConversationWidget(
                  name: name[index],
                ),
              );
            },
            child: MessegeListviewWidget(
              msgIcon: msgIcon[index],
              name: name[index],
              time: formattedTime,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Get.to(
            NewConversationWidget(
              name: '',
            ),
          );
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
