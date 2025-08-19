import 'package:eltakamel/core/app_themes/colors/app_colors.dart';
import 'package:eltakamel/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ShimmerTextContainer extends StatelessWidget {
  const ShimmerTextContainer({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 95,
      height: height ?? 11,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: AppConstants.borderRadiusCircular,
      ),
    );
  }
}
