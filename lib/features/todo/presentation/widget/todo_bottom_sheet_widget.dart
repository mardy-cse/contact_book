import 'package:contact_book/constant/app_space.dart';
import 'package:flutter/material.dart';

class TodoBottomSheetWidget extends StatelessWidget {
  final void Function()? editFunction;
  final void Function()? deleteFunction;

  TodoBottomSheetWidget({this.editFunction, this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: editFunction,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    AppSpace.width10,
                    Text(
                      'Edit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: deleteFunction,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    AppSpace.width10,
                    Text(
                      'Delete',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
