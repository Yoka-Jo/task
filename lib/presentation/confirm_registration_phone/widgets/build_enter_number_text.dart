import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_text.dart';

class BuildEnterNumberText extends StatelessWidget {
  const BuildEnterNumberText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BuildText(
        text: AppStrings.enterPhoneNumber,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
