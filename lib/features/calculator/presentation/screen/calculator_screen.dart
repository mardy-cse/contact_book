import 'package:contact_book/constant/app_space.dart';
import 'package:contact_book/constant/text_constant.dart';
import 'package:contact_book/constant/widget/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculator_controller.dart';
import '../widget/calcaulator_elevetedbutton_widget.dart';
import '../widget/calculator_textfield_widget.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    ///calculator controller access.

    return Scaffold(
      appBar: CustomAppbarWidget(appBarTitle: 'calculator'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CalculatorTextfieldWidget(
                num: CalculatorText.num1,
                controller: controller.num1Controller,
              ),
              AppSpace.height20,
              CalculatorTextfieldWidget(
                num: CalculatorText.num2,
                controller: controller.num2Controller,
              ),
              AppSpace.height20,
              CalculatorTextfieldWidget(
                num: CalculatorText.result,
                controller: controller.resultController,
                readOnly: true,
              ),
              AppSpace.height30,
              Row(
                children: [
                  CalcaulatorElevetedbuttonWidget(
                    buttonName: CalculatorText.add,
                    action: controller.add,
                  ),
                  AppSpace.width10,
                  CalcaulatorElevetedbuttonWidget(
                    action: controller.sub,
                    buttonName: CalculatorText.sub,
                  ),
                  AppSpace.width10,
                  CalcaulatorElevetedbuttonWidget(
                    action: controller.mul,
                    buttonName: CalculatorText.mul,
                  ),
                  AppSpace.width10,
                  CalcaulatorElevetedbuttonWidget(
                    action: controller.div,
                    buttonName: CalculatorText.div,
                  ),
                ],
              ),
              AppSpace.height20,
              CalcaulatorElevetedbuttonWidget(
                action: controller.reset,
                buttonName: CalculatorText.reset,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
