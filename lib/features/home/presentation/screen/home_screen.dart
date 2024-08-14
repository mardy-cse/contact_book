import 'package:flutter/material.dart';

import '../widget/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  List<String> images = [
    'assets/icon/home/images1.png',
    'assets/icon/home/images2.png',
    'assets/icon/home/images3.png',
    'assets/icon/home/images4.png',
    'assets/icon/home/images5.png',
    'assets/icon/home/images6.png',
    'assets/icon/home/images7.jpeg',
    'assets/icon/home/images8.png',
    'assets/icon/home/images9.png',
    'assets/icon/home/images10.png',
  ];
  List<String> appName = [
    'Settings',
    'Contact',
    'Message',
    'clock',
    'calender',
    'chrome',
    'facebook',
    'WhatsApp',
    'skype',
    'gallery',
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: images.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5),
          itemBuilder: (context, index) {
            return HomeScreenWidget(
              circularIcon: images[index],
              appName: appName[index],
            );
          },
        ),
      ),
    );
  }
}
