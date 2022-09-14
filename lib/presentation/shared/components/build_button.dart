// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../resources/colors_manager.dart';
import 'build_text.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool? isLoading;
  const BuildButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          width: 200.0,
          height: 55.0,
          child: isLoading!
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.green,
                  ),
                )
              : ElevatedButton(
                  onPressed: onPressed,
                  child: BuildText(
                    text: text,
                    textColor: AppColors.white,
                    fontSize: 17,
                  ),
                )),
    );
  }
}
