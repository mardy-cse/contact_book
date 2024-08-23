import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';
import '../../../home/presentation/screen/add_note_screen.dart';
import '../controller/todo_controller.dart';
import '../widget/todo_bottom_sheet_widget.dart';
import '../widget/todo_view_widget.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TodoController controller = Get.put(TodoController());

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
                      var docId = data?[index].id;
                      return Column(
                        children: [
                          TodoViewWidget(
                            onTap: () {
                              Get.to(AddNoteScreen(
                                fromWhere: TodoText.viewNote,
                                title: data?[index]['title'],
                                description: data?[index]['description'],
                              ));
                            },
                            option: () {
                              Get.bottomSheet(TodoBottomSheetWidget(
                                editFunction: () {
                                  Get.back();
                                  controller.isSaveIconShow.value = true;
                                  Get.to(AddNoteScreen(
                                    docId: docId,
                                    isEdit: true,
                                    fromWhere: TodoText.viewNote,
                                    title: data?[index]['title'],
                                    description: data?[index]['description'],
                                  ));
                                },
                                deleteFunction: () async {
                                  Get.back();
                                  await FirebaseFirestore.instance
                                      .collection('Todos')
                                      .doc(docId)
                                      .delete();
                                },
                              ));
                            },
                            title: data?[index]['title'],
                            description: data?[index]['description'],
                          ),
                          index == data!.length - 1
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                )
                              : SizedBox.shrink()
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return Center(
                  child: Text(TodoText.noDataFound),
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
