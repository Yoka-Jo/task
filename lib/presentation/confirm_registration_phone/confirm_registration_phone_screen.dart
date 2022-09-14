import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/shared/components/build_sub_text.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import '../shared/components/build_not_sent_try_again_text.dart';
import 'widgets/widgets.dart';

class ConfirmRegistrationPhoneScreen extends StatelessWidget {
  const ConfirmRegistrationPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BuildBackGroundImage(
          foregroundImage: ImagesAsset.phonePasswordScreen,
          foregroundImageHeight: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BuildText(text: AppStrings.welcomeUser),
              const BuildSubText(text: AppStrings.confirmRegistration),
              const SizedBox(height: 100.0),
              const BuildEnterNumberText(),
              const SizedBox(height: 25.0),
              const BuildConfirmRegFormField(),
              const SizedBox(height: 15.0),
              const BuildSendButton(),
              BuildNotSentTryAgainText(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
