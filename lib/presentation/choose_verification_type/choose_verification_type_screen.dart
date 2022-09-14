import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_background_image.dart';
import 'package:task/presentation/resources/assets_manager.dart';

import '../shared/components/build_sub_text.dart';
import '../shared/components/build_text.dart';
import '../resources/strings_manager.dart';
import 'widgets/widgets.dart';

class ChooseVerificationTypeScreen extends StatelessWidget {
  const ChooseVerificationTypeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: BuildBackGroundImage(
        foregroundImage: ImagesAsset.openLock,
        foregroundImageHeight: 220,
        foregroundImageBottomPositioned: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            SizedBox(
                width: 200.0, child: BuildText(text: AppStrings.welcomeUser)),
            BuildSubText(text: AppStrings.loginToContinue),
            SizedBox(height: 50.0),
            BuildChooseMethodContainer(),
          ],
        ),
      ),
    ));
  }
}
