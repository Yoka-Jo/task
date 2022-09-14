import 'package:flutter/material.dart';
import 'package:task/presentation/forgot_password/widgets/build_send_button.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/shared/components/build_enter_your_email_text.dart';
import 'package:task/presentation/shared/components/build_not_sent_try_again_text.dart';
import 'package:task/presentation/shared/components/build_sub_text.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import 'widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const BuildSubText(text: AppStrings.forgotPassword),
              const SizedBox(height: 100.0),
              const BuildEnterYourEmailText(),
              const SizedBox(height: 25.0),
              BuildForgotPasswordFormFields(),
              const SizedBox(height: 15.0),
              const BuildSendButton(),
              BuildNotSentTryAgainText(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
