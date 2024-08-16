import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../controller/contact_controller.dart';
import '../widget/contact_grid_view_widget.dart';
import '../widget/contact_list_view_widget.dart';
import '../widget/create_contact_bottom_sheet_widget.dart';

class MyContactScreen extends StatefulWidget {
  const MyContactScreen({super.key});

  @override
  State<MyContactScreen> createState() => _MyContactScreenState();
}

class _MyContactScreenState extends State<MyContactScreen> {
  //const MyContactScreen({super.key});
  List<String> name = [
    'Mahfujul Haque',
    'Markoney',
    'Md Ruhul Amin',
    'Md Sakibul Hasan',
    'Md Sakir Ahmed',
    'Md Abir BA',
    'MD.Mithu Pramanik',
    'Md Sakhwat Hossen',
    'Mostafiz vai BA',
    'Nazmus Sakib',
    'Puspita BA',
    'Rasel BA Gazipur',
  ];

  List<int> number = [
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
    1311062117,
  ];

  // bool isGridView = true;
  ContactController contactController = Get.put(ContactController());

  // void toggleView() {
  //   setState(() {
  //     isGridView = !isGridView;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarTitle: ContactText.contactAppBarTitle,
        isLeadingIcon: true,
        action: [
          GestureDetector(
            onTap: contactController.toggleView,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return Icon(
                    contactController.isGridView.value
                        ? Icons.list
                        : Icons.grid_view,
                    color: Colors.white,
                  );
                })),
          ),
          // GestureDetector(
          //   onTap: () {
          //     isGridView = true;
          //     setState(() {});
          //   },
          //   child: const Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Icon(
          //       Icons.grid_view,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: Obx(() {
        return contactController.isGridView.value
            ? Card(
                color: Colors.white54,
                elevation: 8,
                shadowColor: Colors.indigoAccent,
                child: GridView.builder(
                  itemCount: name.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ContactGridViewWidget(
                      circularIcon: ContactIcon.Mlogo,
                      contactName: name[index],
                      number: ContactText.enterYourNumber,
                      address: ContactText.enterYourAddress,
                    );
                  },
                ),
              )
            : ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ContactListViewWidget(
                        circularIcon: ContactIcon.Mlogo,
                        contactName: name[index],
                        phoneNumber: ContactText.enterYourNumber,
                        callIcon: ContactIcon.callIcon,
                        onCallIconTapped: () async {
                          // print('mim');
                          final Uri phoneUri = Uri(
                            scheme: 'tel',
                            path: '01798638702',
                            // path: number[index].toString(),
                            // Dynamic number
                          );
                          print('Phone URI: $phoneUri');

                          try {
                            if (await canLaunchUrl(phoneUri)) {
                              await launchUrl(phoneUri);
                            }
                            // else {
                            //   throw 'Could not launch $phoneUri';
                            // }
                          } catch (e, s) {
                            print('Error: $e');
                            print('Strec: $s');
                          }
                        },
                        // {
                        //   Future<void> _makePhoneCall(
                        //       String phoneNumber) async {
                        //     final Uri phoneUri = Uri(
                        //       scheme: 'tel',
                        //       path: '+880${number[index]}',
                        //     );
                        //
                        //     if (await Permission.phone.request().isGranted) {
                        //       if (await canLaunchUrl(phoneUri)) {
                        //         await launchUrl(phoneUri);
                        //       } else {
                        //         print('Could not launch $phoneUri');
                        //       }
                        //     } else {
                        //       print('Phone permission is not granted');
                        //     }
                        //   }
                        // }
                      ),
                      index == name.length - 1
                          ? const SizedBox(
                              height: 70,
                            )
                          : const SizedBox()
                    ],
                  );
                });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Get.bottomSheet(
            CreateContactBottomSheetWidget(),
            backgroundColor: Colors.white,
            isScrollControlled: true,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
