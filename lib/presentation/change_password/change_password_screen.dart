import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import 'widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BuildBackGroundImage(
          foregroundImage: ImagesAsset.cryptoLock,
          foregroundImageHeight: 220,
          foregroundImageBottomPositioned: 35.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BuildText(text: AppStrings.welcomeUser),
              const SizedBox(height: 80.0),
              const BuildChangePasswordText(),
              const SizedBox(height: 25.0),
              BuildChangePasswordFormFields(),
              const SizedBox(height: 15.0),
              const BuildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
