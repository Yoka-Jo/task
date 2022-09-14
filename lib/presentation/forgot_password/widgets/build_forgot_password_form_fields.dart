import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_text_form.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';

class BuildForgotPasswordFormFields extends StatelessWidget {
  BuildForgotPasswordFormFields({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: BuildTextForm(
        controller: emailController,
        hintText: AppStrings.email,
        iconAsset: IconsAsset.mail,
      ),
    );
  }
}
