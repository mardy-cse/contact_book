import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../home/presentation/screen/add_note_screen.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: TodoText.todoTitle),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.edit_calendar_sharp,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(AddNoteScreen());
        },
      ),
    );
  }
}
