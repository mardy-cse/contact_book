import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../../../../constant/widget/custom_listview_builder.dart';
import 'create_contact_screen.dart';

class MyContactScreen extends StatelessWidget {
  //const MyContactScreen({super.key});

  List<String> name = [
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
  ];
  List<int> number = [
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
    01311062117,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: ContactText.contactAppBarTitle,
      ),
      // body: const ListViewBuilder(),
      body: Card(
        color: Colors.white54,
        elevation: 8,
        shadowColor: Colors.indigoAccent,
        child: GridView.builder(
          itemCount: name.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ContactGridViewWidget(
              circularIcon: ContactIcon.Mlogo,
              contactName: name[index],
              // number: number[index].toString(),
              number: ContactText.enterYourNumber,
              address: ContactText.enterYourAddress,
            );
          },
        ),
      ),
      // ListView.builder(
      //     itemCount: famillyName.length,
      //     itemBuilder: (context, index) {
      //       return ContactViewWidget(
      //         circularIcon: ContactIcon.Mlogo,
      //         contactName: famillyName[index],
      //       );
      //     }),
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
