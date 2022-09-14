// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../app/extensions.dart';

class BuildTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? errorText;
  final String iconAsset;
  const BuildTextForm({
    Key? key,
    this.controller,
    required this.hintText,
    required this.iconAsset,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            suffixIcon: SizedBox(
              width: 20.0,
              height: 20.0,
              child: Image.asset(
                iconAsset,
              ),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              errorText.orEmpty(),
              style: Theme.of(context).inputDecorationTheme.errorStyle,
            ),
          )
      ],
    );
  }
}
