import 'dart:developer';

import 'package:contact_book/constant/app_space.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:contact_book/constant/widget/text_field_widget.dart';
import 'package:contact_book/features/auth/presentation/controller/auth_controller.dart';
import 'package:contact_book/features/home/presentation/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../constant/widget/elevated_button_widget.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final String number;

  OtpScreen({
    required this.number,
    required this.verificationId,
  });

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarWidget(appBarTitle: 'Otp screen'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset('assets/animation/otp_animation.json'),
            Text('We sent OTP in provided number: $number'),
            TextFieldWidget(
                controller: authController.otpController,
                labelText: 'Enter Your OTP'),
            AppSpace.height20,
            ElevatedButtonWidget(
              btnName: 'Match OTP',
              onTap: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode:
                              authController.otpController.text.toString());
                  FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) => HomeScreen());
                } catch (ex) {
                  log(ex.toString());
                }
              },
              backgroundColor: Colors.indigo,
            ),
          ],
        ));
  }
}
