import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';

class ContactGridViewWidget extends StatelessWidget {
  final String circularIcon;
  final String contactName;
  final String number;
  final String address;

  const ContactGridViewWidget({
    super.key,
    required this.circularIcon,
    required this.contactName,
    required this.number,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
