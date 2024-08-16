import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';
import '../../../../constant/text_constant.dart';

class ContactGridViewWidget extends StatelessWidget {
  final String circularIcon;
  final String contactName;
  final String number;
  final String address;
  final String? callIcon;
  final VoidCallback? onCallIconTapped;

  const ContactGridViewWidget({
    super.key,
    required this.circularIcon,
    required this.contactName,
    required this.number,
    required this.address,
    this.callIcon,
    this.onCallIconTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(circularIcon),
            ),
            AppSpace.width20,
            Text(
              contactName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              number,
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              address,
              style: const TextStyle(fontSize: 15),
            ),
            GestureDetector(
              onTap: onCallIconTapped,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(callIcon ?? ''),
              ),
              onLongPress: () {
                Container(
                  height: 200,
                  width: double.infinity,
                  child: const Column(
                    children: [
                      Text(ContactText.edit),
                      Text(ContactText.delete),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
