import 'package:flutter/material.dart';

import '../../../../constant/text_constant.dart';
import 'create_contact_bottom_sheet_widget.dart';

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
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.indigo,
            actions: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return CreateContactBottomSheetWidget(
                        edit: ContactText.editContact,
                      );
                    },
                  );
                },
                child: const Text(
                  ContactText.edit,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  ContactText.delete,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
      child: Padding(
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
      ),
    );
  }
}
