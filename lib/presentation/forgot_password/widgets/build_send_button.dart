import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';

class BuildSendButton extends StatelessWidget {
  const BuildSendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildButton(
        text: AppStrings.send,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.confirmResettingPassCodeRoute);
        });
  }
}
