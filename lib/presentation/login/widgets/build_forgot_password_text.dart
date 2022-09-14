import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_text.dart';

class BuildForgotPasswordText extends StatelessWidget {
  const BuildForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.forgotPasswordRoute);
        },
        child: const BuildText(
          text: AppStrings.haveYouForgottenPassword,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
