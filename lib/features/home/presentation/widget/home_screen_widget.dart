import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';

class HomeScreenWidget extends StatelessWidget {
  final String circularIcon;
  final String appName;
  final VoidCallback? onTap;

  const HomeScreenWidget(
      {super.key,
      required this.circularIcon,
      required this.appName,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: 42,
              width: 42,
              child: Image(
                image: AssetImage(circularIcon),
              ),
            ),
            AppSpace.height5,
            Text(appName),
          ],
        ),
      ),
    );
  }
}
