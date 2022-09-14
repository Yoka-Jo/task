import 'package:flutter/material.dart';
import 'package:task/presentation/confirm_resetting_pass_code/widgets/build_confirm_button.dart';
import 'package:task/presentation/confirm_resetting_pass_code/widgets/build_confirm_code_text.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/shared/components/build_sub_text.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/shared/components/build_try_agian.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'widgets/widgets.dart';
import '../resources/strings_manager.dart';

class ConfirmResettingPassCodeScreen extends StatelessWidget {
  const ConfirmResettingPassCodeScreen({Key? key}) : super(key: key);

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
              const BuildConfirmCodeTex(),
              const SizedBox(height: 20.0),
              BuildPinCodeFields(),
              const BuildConfirmButton(),
              const BuildTryAgain()
            ],
          ),
        ),
      ),
    );
  }
}
