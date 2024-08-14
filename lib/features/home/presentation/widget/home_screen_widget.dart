import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';

class HomeScreenWidget extends StatelessWidget {
  final String circularIcon;
  final String appName;

  const HomeScreenWidget(
      {super.key, required this.circularIcon, required this.appName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.red, width: 2)),
            child: Image(
              image: AssetImage(circularIcon),
            ),
            // CircleAvatar(
            //   radius: 30,
            //   backgroundImage: AssetImage(circularIcon),
            // ),
          ),
          AppSpace.height5,
          Text(appName),
        ],
      ),
    );
  }
}
