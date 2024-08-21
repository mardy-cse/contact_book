import 'dart:developer';

import 'package:contact_book/constant/app_space.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../../../../constant/widget/elevated_button_widget.dart';
import '../../../../constant/widget/text_field_widget.dart';
import '../controller/auth_controller.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: 'Compact App'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Lottie.asset('assets/animation/person.json')),
          ),
          AppSpace.height10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldWidget(
              controller: authController.numberController,
              labelText: AuthText.enterYourNumber,
              keyboardType: TextInputType.number,
              suffixIcon: Icon(Icons.call),
              onChanged: (value) {
                authController.isButtonEnable.value =
                    authController.numberController.text.isNotEmpty;
              },
            ),
          ),
          AppSpace.height10,
          Obx(() {
            return ElevatedButtonWidget(
              btnName: AuthText.submit,
              backgroundColor: authController.isButtonEnable.value
                  ? Colors.indigo
                  : Colors.grey,
              onTap: authController.isButtonEnable.value
                  ? () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: authController.numberController.text,
                        timeout: const Duration(seconds: 60),
                        // Set a reasonable timeout
                        verificationCompleted:
                            (PhoneAuthCredential credential) {
                          // Handle auto-retrieval or auto-verification here
                        },
                        verificationFailed: (FirebaseAuthException ex) {
                          if (ex.code == 'session-expired') {
                            // Show a message to the user to request a new OTP
                            Get.snackbar('Session Expired',
                                'The SMS code has expired. Please request a new code.');
                          } else {
                            log('Exception: ${ex.toString()}');
                          }
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          Get.to(OtpScreen(
                            number:
                                authController.numberController.text.toString(),
                            verificationId: verificationId,
                          ));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          // Optionally handle timeout here
                        },
                      );

                      authController.numberController.clear();
                      authController.isButtonEnable.value = false;
                    }
                  : () {}, // Use an empty function instead of null
            );
          })
        ],
      ),
    );
  }
}
