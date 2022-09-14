// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task/presentation/shared/components/build_text.dart';
import 'package:task/presentation/resources/colors_manager.dart';

class BuildMethodContainer extends StatelessWidget {
  final String image;
  final String title;
  final String bodyText;
  final VoidCallback onTap;
  const BuildMethodContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.bodyText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
        color: AppColors.accentGreen,
        radius: const Radius.circular(6.0),
        borderType: BorderType.RRect,
        child: Row(textDirection: TextDirection.rtl, children: [
          Image.asset(image),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BuildText(
                text: title,
                textColor: AppColors.accentGreen,
                fontSize: 15.0,
              ),
              BuildText(
                text: bodyText,
                textColor: AppColors.green,
                fontSize: 12.0,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
