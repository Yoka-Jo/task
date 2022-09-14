import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task/presentation/resources/colors_manager.dart';

// ignore: must_be_immutable
class BuildPinCodeFields extends StatelessWidget {
  BuildPinCodeFields({Key? key}) : super(key: key);

  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 4,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 70,
        fieldWidth: 70,
        borderWidth: 1,
        activeColor: AppColors.accentGreen,
        inactiveColor: AppColors.accentGreen,
        inactiveFillColor: AppColors.white,
        activeFillColor: AppColors.accentGreen,
        selectedColor: AppColors.accentGreen,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        otpCode = submitedCode;
        log("Completed");
      },
      onChanged: (value) {
        log(value);
      },
    );
  }
}
