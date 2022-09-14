import 'package:flutter/material.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/colors_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';

import 'build_text.dart';

class BuildTryAgain extends StatelessWidget {
  const BuildTryAgain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconsAsset.reload),
        const SizedBox(
          width: 5.0,
        ),
        const BuildText(
          text: AppStrings.tryAgain,
          fontSize: 14.0,
          textColor: AppColors.accentGreen,
        ),
      ],
    );
  }
}
