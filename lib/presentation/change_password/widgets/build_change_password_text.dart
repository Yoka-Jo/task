import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_text.dart';

class BuildChangePasswordText extends StatelessWidget {
  const BuildChangePasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BuildText(
          text: AppStrings.changePassword, fontWeight: FontWeight.w500),
    );
  }
}
