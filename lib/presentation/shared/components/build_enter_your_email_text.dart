import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_text.dart';

class BuildEnterYourEmailText extends StatelessWidget {
  const BuildEnterYourEmailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BuildText(
        text: AppStrings.pleaseEnterYourEmail,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
