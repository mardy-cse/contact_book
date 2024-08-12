import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../../../../constant/widget/custom_listview_builder.dart';
import 'create_contact_screen.dart';

class MyContactScreen extends StatelessWidget {
  //const MyContactScreen({super.key});

  var name = [
    'Mahfujul Haque',
    'Markoney',
    'Md Ruhul Amin',
    'Md Sakibul Hasan',
    'Md Sakir Ahmed',
    'Md Abir BA',
    'MD.Mithu Pramanik',
    'Md Sakhwat Hossen',
    'Mostafiz vai BA',
    'Nazmus Sakib',
    'Puspita BA',
    'Rasel BA Gazipur',
    'Rasel BA Gazipur',
    'Rasel BA Gazipur',
    'Rasel BA Gazipur',
    'Rasel BA Gazipur',
    'Rasel BA Gazipur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: ContactText.contactAppBarTitle,
      ),
      // body: const ListViewBuilder(),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            return ContactViewWidget(
              circularIcon: ContactIcon.Mlogo,
              contactName: name[index],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Get.bottomSheet(
            CreateContactScreen(),
            backgroundColor: Colors.white,
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
