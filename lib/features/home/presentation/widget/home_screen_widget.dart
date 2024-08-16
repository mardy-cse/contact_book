import 'package:flutter/material.dart';

import '../../../../constant/app_space.dart';

class HomeScreenWidget extends StatelessWidget {
  final String iconPath;
  final String appName;
  final VoidCallback? onTap;

  const HomeScreenWidget({
    super.key,
    required this.iconPath,
    required this.appName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     decoration: BoxDecoration(color: Colors.transparent),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             height: 42,
    //             width: 42,
    //             child: Image.asset(iconPath),
    //           ),
    //           AppSpace.height5,
    //           Text(appName),
    //         ],
    //       ),
    //     ),
    //   ),
    // ));
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 42,
              width: 42,
              child: Image.asset(iconPath),
            ),
            AppSpace.height5,
            Text(appName),
          ],
        ),
      ),
    );
  }
}
