import 'package:flutter/material.dart';

class ContactListViewWidget extends StatelessWidget {
  final String circularIcon;
  final String contactName;
  final String phoneNumber;
  final String callIcon;
  final VoidCallback onCallIconTapped;

  const ContactListViewWidget(
      {super.key,
      required this.circularIcon,
      required this.contactName,
      required this.phoneNumber,
      required this.callIcon,
      required this.onCallIconTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(circularIcon),
          ),
          title: Text(
            contactName,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            phoneNumber,
            style: const TextStyle(fontSize: 13),
          ),
          trailing: GestureDetector(
            onTap: onCallIconTapped,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(callIcon),
            ),
          ),
        ),
      ),
    );
  }
}
