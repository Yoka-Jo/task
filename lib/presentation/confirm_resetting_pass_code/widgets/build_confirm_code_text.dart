import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_text.dart';

class BuildConfirmCodeTex extends StatelessWidget {
  const BuildConfirmCodeTex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BuildText(
        text: AppStrings.confirmCode,
        fontSize: 18.0,
      ),
    );
  }
}
