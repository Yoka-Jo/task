import 'package:flutter/material.dart';

import 'package:task/presentation/resources/assets_manager.dart';

class BuildBackGroundImage extends StatelessWidget {
  final Widget child;
  final String foregroundImage;
  final double foregroundImageHeight;
  final double? foregroundImageBottomPositioned;
  const BuildBackGroundImage({
    Key? key,
    required this.child,
    required this.foregroundImage,
    required this.foregroundImageHeight,
    this.foregroundImageBottomPositioned = -10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              ShapePatternsAsset.background,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              ShapePatternsAsset.wave,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      Positioned(
        left: 30.0,
        bottom: foregroundImageBottomPositioned,
        child: Image.asset(
          foregroundImage,
          height: foregroundImageHeight,
          fit: BoxFit.fitHeight,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: child,
        ),
      ),
    ]);
  }
}
