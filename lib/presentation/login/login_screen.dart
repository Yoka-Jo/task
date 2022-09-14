import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/shared/components/build_sub_text.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import '../shared/components/build_title_for_form_fields.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BuildBackGroundImage(
            foregroundImage: ImagesAsset.cleaningTools,
            foregroundImageHeight: 270.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                BuildText(text: AppStrings.welocmeBack),
                BuildSubText(text: AppStrings.loginToContinue),
                SizedBox(height: 50.0),
                BuildTitleForFormFields(text: AppStrings.login),
                SizedBox(height: 20.0),
                BuildLoginFormFields(),
                BuildForgotPasswordText(),
                BuildLoginButton(),
                BuildHaveNoAccountText(),
              ],
            ),
          )),
    );
  }
}
