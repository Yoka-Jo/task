import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_text_for_another_option.dart';

class BuildHaveNoAccountText extends StatelessWidget {
  const BuildHaveNoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildTextForAnotherOption(
      plainText: AppStrings.haveNoAccount,
      underlinedText: AppStrings.newRegisteration,
      onTap: () {
        Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
      },
    );
  }
}
