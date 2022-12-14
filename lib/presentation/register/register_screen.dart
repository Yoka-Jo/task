import 'package:flutter/material.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import '../shared/components/build_background_image.dart';
import '../shared/components/build_sub_text.dart';
import '../shared/components/build_text.dart';
import '../shared/components/build_title_for_form_fields.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BuildBackGroundImage(
          foregroundImage: ImagesAsset.cleanWorker,
          foregroundImageHeight: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BuildText(text: AppStrings.welcome),
              const BuildSubText(text: AppStrings.createAccountToStart),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const BuildTitleForFormFields(text: AppStrings.newRegisteration),
              const SizedBox(height: 20.0),
              const BuildRegisterFormFields(),
              const BuildRegisterButton(),
              const BuildHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
