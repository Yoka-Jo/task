import 'package:flutter/material.dart';
import 'package:task/presentation/resources/colors_manager.dart';

class BuildSubTitle extends StatelessWidget {
  final String text;
  final Color? textColor;

  const BuildSubTitle(
      {Key? key, required this.text, this.textColor = AppColors.green})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
    );
  }
}
