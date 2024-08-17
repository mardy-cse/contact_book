import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';
import '../../../../constant/text_constant.dart';
import 'create_contact_bottom_sheet_widget.dart';

class ContactGridViewWidget extends StatelessWidget {
  final String circularIcon;
  final String contactName;
  final String number;
  final String address;
  final String elevetedButon;
  final VoidCallback onCallIconTapped;

  const ContactGridViewWidget({
    super.key,
    required this.circularIcon,
    required this.contactName,
    required this.number,
    required this.address,
    required this.elevetedButon,
    required this.onCallIconTapped,
  });

  // var data = snapshot.data?.docs[index];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            AppSpace.width5,
                            Text(
                              ContactText.edit,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpace.height10,
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            AppSpace.width5,
                            Text(
                              ContactText.delete,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      child: Card(
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
              ElevatedButton(
                onPressed: onCallIconTapped,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  fixedSize: const Size(140, 40), // Updated button size
                ),
                child: const Text(
                  ContactText.callEleveted,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
