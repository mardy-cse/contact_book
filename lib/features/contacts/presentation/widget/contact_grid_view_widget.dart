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
            backgroundColor: Colors.indigo,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateContactBottomSheetWidget(),
                      ));
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
              GestureDetector(
                onTap: onCallIconTapped,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(Size(80, 8)),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.indigoAccent)),
                  onPressed: () {
                    elevetedButon;
                    //   {
                    //     final Uri phoneUri = Uri(
                    //       scheme: 'tel',
                    //       path: data?['number'],
                    //     );
                    //     print('Phone URI: $phoneUri');
                    //
                    //     try {
                    //       if (await canLaunchUrl(phoneUri)) {
                    //   await launchUrl(phoneUri);
                    //   }
                    //   } catch (e, s) {
                    //   print('Error: $e');
                    //   print('Strec: $s');
                    //   }
                    // },
                  },
                  child: const Text(
                    ContactText.callEleveted,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
