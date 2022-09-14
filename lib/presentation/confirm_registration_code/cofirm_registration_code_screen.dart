// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/shared/components/build_sub_text.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/shared/components/build_try_agian.dart';

import '../resources/strings_manager.dart';
import 'widgets/widgets.dart';

class ConfirmRegistrationCodeScreen extends StatelessWidget {
  final Map<String, String> confirmData;
  const ConfirmRegistrationCodeScreen({
    Key? key,
    required this.confirmData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(confirmData.toString());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BuildBackGroundImage(
          foregroundImage: ImagesAsset.lockWithKey,
          foregroundImageHeight: 220,
          foregroundImageBottomPositioned: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BuildText(text: AppStrings.welcomeUser),
              const BuildSubText(text: AppStrings.confirmRegistration),
              const SizedBox(height: 100.0),
              const BuildConfirmCodeText(),
              const SizedBox(height: 20.0),
              const BuildPinCodeFields(),
              BuildConfirmRegButton(
                confirmData: confirmData,
              ),
              const BuildTryAgain()
            ],
          ),
        ),
      ),
    );
  }
}
