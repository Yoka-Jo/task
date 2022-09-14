import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_text_for_another_option.dart';

class BuildNotSentTryAgainText extends StatelessWidget {
  final VoidCallback onTap;
  const BuildNotSentTryAgainText({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildTextForAnotherOption(
      plainText: AppStrings.haveNotSent,
      underlinedText: AppStrings.tryAgain,
      onTap: onTap,
    );
  }
}
