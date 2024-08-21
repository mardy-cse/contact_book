import 'package:contact_book/constant/text_constant.dart';
import 'package:flutter/material.dart';

class MessegeBottomsheetWidget extends StatelessWidget {
  // String name;
  const MessegeBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController msgcontroler = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 1,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: msgcontroler,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.indigoAccent,
                    width: 2,
                  ),
                ),
                // suffix: Text(MessegeText.prefixTo),
                prefixIcon: Text(
                  MessegeText.prefixTo,
                  style: TextStyle(fontSize: 18),
                ),
                labelText: MessegeText.labelText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
