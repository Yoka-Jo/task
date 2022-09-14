import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_text.dart';
import 'build_method_container.dart';

class BuildChooseMethodContainer extends StatelessWidget {
  const BuildChooseMethodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BuildText(
          text: AppStrings.chooseOneMethod,
          fontSize: 15,
        ),
        const SizedBox(height: 30.0),
        BuildMethodContainer(
          image: ImagesAsset.mobileApp,
          title: AppStrings.phoneNumber,
          bodyText: AppStrings.enterPhoneNumberToSendCode,
          onTap: () => Navigator.of(context)
              .pushNamed(Routes.confirmRegistrationPhoneRoute),
        ),
        const SizedBox(
          height: 20.0,
        ),
        BuildMethodContainer(
          image: ImagesAsset.email,
          title: AppStrings.email,
          bodyText: AppStrings.enterEamilToSendCode,
          onTap: () => Navigator.of(context)
              .pushNamed(Routes.confirmRegistrationEmailRoute),
        ),
      ],
    );
  }
}
