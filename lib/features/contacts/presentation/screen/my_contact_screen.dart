import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant/app_space.dart';
import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../controller/contact_controller.dart';
import '../widget/contact_grid_view_widget.dart';
import '../widget/contact_list_view_widget.dart';
import '../widget/create_contact_bottom_sheet_widget.dart';

class MyContactScreen extends StatefulWidget {
  MyContactScreen({super.key});

  @override
  State<MyContactScreen> createState() => _MyContactScreenState();
}

class _MyContactScreenState extends State<MyContactScreen> {
  ContactController contactController = Get.put(ContactController());

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Contacts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Obx(() {
                  return contactController.isGridView.value
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            var data = snapshot.data?.docs[index];
                            return ContactGridViewWidget(
                              circularIcon: ContactIcon.Mlogo,
                              contactName: data?['name'],
                              number: data?['number'],
                              address: data?['address'],
                              elevetedButon: ContactText.callEleveted,
                              onCallIconTapped: () async {
                                final Uri phoneUri = Uri(
                                  scheme: 'tel',
                                  path: data?['number'],
                                );
                                print('Phone URI: $phoneUri');

                                try {
                                  if (await canLaunchUrl(phoneUri)) {
                                    await launchUrl(phoneUri);
                                  }
                                } catch (e, s) {
                                  print('Error: $e');
                                  print('Strec: $s');
                                }
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return CreateContactBottomSheetWidget(
                                                    title:
                                                        ContactText.editContact,
                                                    updateButton:
                                                        ContactText.update,
                                                    name: data?['name'],
                                                    number: data?['number'],
                                                    email: data?['email'],
                                                    address: data?['address'],
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
                                                    style: TextStyle(
                                                        color: Colors.black),
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
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              // onCallIconTapped: () async {
                              //   final Uri phoneUri = Uri(
                              //     scheme: 'tel',
                              //     // path: '01798638702',
                              //     path: data?['number'],
                              //     // Dynamic number
                              //   );
                              //   print('Phone URI: $phoneUri');
                              //   if (await canLaunchUrl(phoneUri)) {
                              //     await launchUrl(phoneUri);
                              //   } else {
                              //     throw 'Could not launch $phoneUri';
                              //   }
                              // },
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data?.docs[index];
                            return Column(
                              children: [
                                ContactListViewWidget(
                                  circularIcon: ContactIcon.Mlogo,
                                  contactName: data?['name'],
                                  phoneNumber: data?['number'],
                                  callIcon: ContactIcon.callIcon,
                                  onCallIconTapped: () async {
                                    final Uri phoneUri = Uri(
                                      scheme: 'tel',
                                      path: data?['number'],
                                    );
                                    print('Phone URI: $phoneUri');

                                    try {
                                      if (await canLaunchUrl(phoneUri)) {
                                        await launchUrl(phoneUri);
                                      }
                                    } catch (e, s) {
                                      print('Error: $e');
                                      print('Strec: $s');
                                    }
                                  },
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actions: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    builder: (context) {
                                                      return CreateContactBottomSheetWidget(
                                                        title: ContactText
                                                            .editContact,
                                                        updateButton:
                                                            ContactText.update,
                                                        name: data?['name'],
                                                        number: data?['number'],
                                                        email: data?['email'],
                                                        address:
                                                            data?['address'],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit,
                                                        color: Colors.black,
                                                      ),
                                                      AppSpace.width5,
                                                      Text(
                                                        ContactText.edit,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete,
                                                        color: Colors.black,
                                                      ),
                                                      AppSpace.width5,
                                                      Text(
                                                        ContactText.delete,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                index == snapshot.data!.docs.length - 1
                                    ? const SizedBox(
                                        height: 70,
                                      )
                                    : const SizedBox()
                              ],
                            );
                          });
                });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return Center(
                  child: Text('No Contacts Found'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Get.bottomSheet(
            CreateContactBottomSheetWidget(
              title: ContactText.newContact,
              updateButton: ContactText.save,
            ),
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
