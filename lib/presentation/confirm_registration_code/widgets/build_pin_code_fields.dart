import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task/presentation/confirm_registration_code/cubit/confirm_registration_code_cubit.dart';
import 'package:task/presentation/resources/colors_manager.dart';

class BuildPinCodeFields extends StatefulWidget {
  const BuildPinCodeFields({Key? key}) : super(key: key);

  @override
  State<BuildPinCodeFields> createState() => _BuildPinCodeFieldsState();
}

class _BuildPinCodeFieldsState extends State<BuildPinCodeFields> {
  final pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pinCodeController.addListener(() {
      context
          .read<ConfirmRegistrationCodeCubit>()
          .setPinCode(pinCodeController.text);
    });
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDisposeControllers: false,
      controller: pinCodeController,
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
      onChanged: (value) {},
    );
  }
}
