import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../widget/contact_grid_view_widget.dart';
import '../widget/contact_list_view_widget.dart';
import '../widget/create_contact_bottom_sheet_widget.dart';

class MyContactScreen extends StatefulWidget {
  @override
  State<MyContactScreen> createState() => _MyContactScreenState();
}

class _MyContactScreenState extends State<MyContactScreen> {
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

  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: ContactText.contactAppBarTitle,
        action: [
          GestureDetector(
            onTap: () {
              isGridView = false;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.list,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              isGridView = true;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.grid_view,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: isGridView
          ? Card(
              color: Colors.white54,
              elevation: 8,
              shadowColor: Colors.indigoAccent,
              child: GridView.builder(
                itemCount: name.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ContactGridViewWidget(
                    circularIcon: ContactIcon.Mlogo,
                    contactName: name[index],
                    number: ContactText.enterYourNumber,
                    address: ContactText.enterYourAddress,
                  );
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return ContactListViewWidget(
                      circularIcon: ContactIcon.Mlogo,
                      contactName: name[index],
                      phoneNumber: ContactText.enterYourNumber,
                      callIcon: ContactIcon.callIcon,
                      onCallIconTapped: () {
                        print('callIcon tapped');
                      },
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Get.bottomSheet(
            CreateContactBottomSheetWidget(),
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
