import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';
import '../../../../constant/text_constant.dart';
import 'create_contact_bottom_sheet_widget.dart';

class ContactListViewWidget extends StatelessWidget {
  final String circularIcon;
  final String contactName;
  final String phoneNumber;
  final String callIcon;
  final VoidCallback onCallIconTapped;
  final VoidCallback onLongPress;

  const ContactListViewWidget(
      {super.key,
      required this.circularIcon,
      required this.contactName,
      required this.phoneNumber,
      required this.callIcon,
      required this.onCallIconTapped,
        required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      // onLongPress: () {
      //   showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       backgroundColor: Colors.indigo,
      //       actions: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             TextButton(
      //               onPressed: () {
      //                 showModalBottomSheet(
      //                   context: context,
      //                   isScrollControlled: true,
      //                   builder: (context) {
      //                     return CreateContactBottomSheetWidget(
      //                       title: ContactText.editContact,
      //                     );
      //                   },
      //                 );
      //               },
      //               child: const Align(
      //                 alignment: Alignment.centerLeft,
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.edit,
      //                       color: Colors.white,
      //                     ),
      //                     AppSpace.width5,
      //                     Text(
      //                       ContactText.edit,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             AppSpace.height10,
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //               child: const Align(
      //                 alignment: Alignment.centerLeft,
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.delete,
      //                       color: Colors.white,
      //                     ),
      //                     AppSpace.width5,
      //                     Text(
      //                       ContactText.delete,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   );
      // },
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
