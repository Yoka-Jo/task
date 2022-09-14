import 'package:flutter/material.dart';
import 'package:task/presentation/resources/routes_manager.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';

class BuildSaveButton extends StatelessWidget {
  const BuildSaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildButton(
        text: AppStrings.save,
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
        });
  }
}
