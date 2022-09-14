import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final bool? isTextUnderlined;
  final FontWeight? fontWeight;
  const BuildText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.isTextUnderlined,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: textColor,
            fontSize: fontSize,
            decoration:
                isTextUnderlined == null ? null : TextDecoration.underline,
            fontWeight: fontWeight,
          ),
    );
  }
}
