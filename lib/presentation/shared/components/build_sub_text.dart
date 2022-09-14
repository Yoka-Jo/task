import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import 'build_text.dart';

class BuildSubText extends StatelessWidget {
  final String text;
  const BuildSubText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BuildText(
      text: text,
      textColor: AppColors.accentGreen,
      fontSize: 18.0,
    );
  }
}
