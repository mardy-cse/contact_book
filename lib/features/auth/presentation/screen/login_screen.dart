import 'package:contact_book/constant/app_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constant/text_constant.dart';
import '../../../../constant/widget/custom_appbar_widget.dart';
import '../../../../constant/widget/elevated_button_widget.dart';
import '../../../../constant/widget/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: 'Compact App'),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSpace.height10,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: SvgPicture.asset(AuthIcon.loginIcon)),
          ),
          AppSpace.height10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldWidget(
              controller: controller,
              labelText: AuthText.enterYourNumber,
              keyboardType: TextInputType.number,
              suffixIcon: Icon(Icons.call),
            ),
          ),
          AppSpace.height10,
          ElevatedButtonWidget(
            btnName: AuthText.submit,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
