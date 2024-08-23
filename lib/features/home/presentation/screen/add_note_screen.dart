import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book/features/todo/presentation/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/text_constant.dart';

class AddNoteScreen extends StatefulWidget {
  final String? title;
  final String? description;
  final String? fromWhere;
  final bool? isEdit;
  final String? docId;

  AddNoteScreen(
      {this.title,
      this.description,
      this.fromWhere,
      this.isEdit = false,
      this.docId});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TodoController controller = Get.find();

  loadData() {
    controller.titleController.text = widget.title!;
    controller.descriptionController.text = widget.description!;
  }

  @override
  void initState() {
    if (widget.fromWhere == TodoText.viewNote) {
      loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            // height: 50.0,
            color: Colors.indigo,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: IconButton(
                        onPressed: () {
                          controller.titleController.clear();
                          controller.descriptionController.clear();
                          controller.isSaveIconShow.value = false;
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Expanded(
                      child: TextField(
                    readOnly: widget.fromWhere == TodoText.viewNote &&
                            widget.isEdit == false
                        ? true
                        : false,
                    controller: controller.titleController,
                    onChanged: (value) => controller.canSave(),
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: TodoText.title,
                        hintStyle: TextStyle(color: Colors.white)),
                  )),
                  Obx(() {
                    return controller.isSaveIconShow.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: IconButton(
                                onPressed: () async {
                                  widget.isEdit == true
                                      ? await FirebaseFirestore.instance
                                          .collection('Todos')
                                          .doc(widget.docId)
                                          .update({
                                          'title':
                                              controller.titleController.text,
                                          'description': controller
                                              .descriptionController.text,
                                        }).then((value) {
                                          controller.titleController.clear();
                                          controller.descriptionController
                                              .clear();
                                          controller.isSaveIconShow.value =
                                              false;
                                          Get.back();
                                        })
                                      : await FirebaseFirestore.instance
                                          .collection('Todos')
                                          // .doc(controller.titleController.text)
                                          .add({
                                          'title':
                                              controller.titleController.text,
                                          'description': controller
                                              .descriptionController.text,
                                        }).then((value) {
                                          controller.titleController.clear();
                                          controller.descriptionController
                                              .clear();
                                          controller.isSaveIconShow.value =
                                              false;
                                          Get.back();
                                        });
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )),
                          )
                        : SizedBox.shrink();
                  })
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                left: 15,
                right: 15),
            child: SingleChildScrollView(
                child: TextField(
              readOnly: widget.fromWhere == TodoText.viewNote &&
                      widget.isEdit == false
                  ? true
                  : false,
              controller: controller.descriptionController,
              autofocus: true,
              maxLines: null,
              autocorrect: true,
              onChanged: (value) => controller.canSave(),
              decoration: InputDecoration(
                  hintText: TodoText.writeYourNote, border: InputBorder.none),
            )),
          )
        ],
      ),
    );
  }
}
