import 'package:flutter/material.dart';
import 'package:task/presentation/resources/colors_manager.dart';

import '../../shared/components/build_text.dart';

class BuildTextForAnotherOption extends StatelessWidget {
  final String plainText;
  final String underlinedText;
  final VoidCallback onTap;
  const BuildTextForAnotherOption({
    Key? key,
    required this.plainText,
    required this.underlinedText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildText(
          text: plainText,
          fontSize: 14.0,
        ),
        const SizedBox(
          width: 5.0,
        ),
        InkWell(
          onTap: onTap,
          child: BuildText(
            text: underlinedText,
            isTextUnderlined: true,
            fontSize: 14.0,
            textColor: AppColors.accentGreen,
          ),
        ),
      ],
    );
  }
}
