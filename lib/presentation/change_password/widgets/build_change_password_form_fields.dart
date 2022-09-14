import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_text_form.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';

class BuildChangePasswordFormFields extends StatelessWidget {
  BuildChangePasswordFormFields({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          BuildTextForm(
            controller: passwordController,
            hintText: AppStrings.password,
            iconAsset: IconsAsset.lock,
          ),
          const SizedBox(height: 15.0),
          BuildTextForm(
            hintText: AppStrings.confirmPassword,
            iconAsset: IconsAsset.lock,
          ),
        ],
      ),
    );
  }
}
