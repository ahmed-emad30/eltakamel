import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, SliverAppBar;

import '../app_themes/colors/app_colors.dart' show AppColors;
import '../app_themes/text_style/app_text_style.dart' show AppTextStyle;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.scaffoldBackground,
      // backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      floating: true,
      pinned: false,
      snap: true,
      title: Text(title, style: AppTextStyle.style15Medium),
    );
  }
}
