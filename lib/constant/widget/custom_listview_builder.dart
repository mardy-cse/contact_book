import 'package:flutter/material.dart';

import '../app_space.dart';
import '../text_constant.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
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
    var color = [
      Colors.green,
      Colors.blueAccent,
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.green,
    ];
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(ContactIcon.Mlogo),
                      // backgroundColor: (color[index]),
                    ),
                    AppSpace.width20,
                    Text(
                      name[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: name.length,
      ),
    );
  }
}

/// Modified....
class ContactViewWidget extends StatelessWidget {
  final String circularIcon;
  final String contactName;

  const ContactViewWidget(
      {super.key, required this.circularIcon, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(circularIcon),
              ),
              AppSpace.width20,
              Text(
                contactName,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
