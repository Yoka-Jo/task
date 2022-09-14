import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import '../../shared/components/build_text.dart';

class BuildTitleForFormFields extends StatelessWidget {
  final String text;
  const BuildTitleForFormFields({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: [
        const SizedBox(
          width: 30.0,
          child: Divider(
            color: AppColors.green,
            height: 30,
            indent: 10.0,
            thickness: 2,
          ),
        ),
        BuildText(
          text: text,
          textColor: AppColors.green,
          fontSize: 17.0,
        ),
      ],
    );
  }
}
