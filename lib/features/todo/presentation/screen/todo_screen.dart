import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../home/presentation/screen/add_note_screen.dart';
import '../widget/todo_view_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: TodoText.todoTitle),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Todos').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                var data = snapshot.data?.docs;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return TodoViewWidget(
                        onTap: () {
                          Get.to(AddNoteScreen(
                            fromWhere: 'viewNote',
                            title: data?[index]['title'],
                            description: data?[index]['description'],
                          ));
                        },
                        title: data?[index]['title'],
                        description: data?[index]['description'],
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return Center(
                  child: Text('No Data Found'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
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
