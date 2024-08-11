import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../../../../constant/widget/custom_listview_builder.dart';
import 'create_contact_screen.dart';

class MyContactScreen extends StatelessWidget {
  const MyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: ContactText.contactAppBarTitle,
      ),
      body: const ListViewBuilder(),
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
