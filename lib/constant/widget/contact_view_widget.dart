import 'package:flutter/material.dart';

import '../app_space.dart';

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
