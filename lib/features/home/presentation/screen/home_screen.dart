import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../../../contacts/presentation/screen/my_contact_screen.dart';
import '../widget/drawer_listview_widget.dart';
import '../widget/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<String> images = [
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
  final List<String> appName = [
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
  final List<String> tittle = [
    'My Files',
    'Shared with Me',
    'Starred',
    'Recent',
    'offline',
    'Uploads',
    'Backups',
  ];
  final List<IconData?> icon = [
    Icons.folder,
    Icons.person_2,
    Icons.star,
    Icons.lock_clock,
    Icons.offline_pin,
    Icons.upload,
    Icons.backup,
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: 'Home',
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(ContactIcon.person3Icon),
              ),
            ),
            DropdownSearch(
              dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                enabled: true,
                // hintText: 'select',
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(HomeText.drawerPic),
                    Text(
                      HomeText.subTitlename,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                filled: true,
                fillColor: Colors.teal,

                labelStyle: TextStyle(color: Colors.black, fontSize: 20),
              )),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tittle.length,
              itemBuilder: (context, index) {
                return DrawerListviewWidget(
                  icon: icon[index],
                  tittle: tittle[index],
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/icon/home/home_background.png',
                ))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5),
            itemBuilder: (context, index) {
              return HomeScreenWidget(
                iconPath: images[index],
                appName: appName[index],
                onTap: () {
                  ///We can also perform it using switch case
                  if (appName[index] == 'Contact') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyContactScreen()));
                  } else {}
                },
                // backgroundImage: HomeIcon.homeBackground,
              );
            },
          ),
        ),
      ),
    );
  }
}
