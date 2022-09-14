import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_text_for_another_option.dart';

class BuildHaveAccountText extends StatelessWidget {
  const BuildHaveAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildTextForAnotherOption(
      plainText: AppStrings.alreadyHaveAccount,
      underlinedText: AppStrings.login,
      onTap: () {
        Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
      },
    );
  }
}
