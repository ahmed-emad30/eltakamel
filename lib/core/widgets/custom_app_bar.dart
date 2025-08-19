import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, SliverAppBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltakamel/core/widgets/top_app_navigator.dart' show TopAppNavigator;

import '../../gen/assets.gen.dart' show $AssetsImagesPhotosGen;
import '../app_themes/colors/app_colors.dart' show AppColors;
import '../app_themes/text_style/app_text_style.dart' show AppTextStyle;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: AppColors.scaffoldBackground,
      // backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      floating: true,
      pinned: false,
      snap: true,
      title: Text(title,style: AppTextStyle.style15Medium,),
      flexibleSpace: Container(
        height: 1.sh,
        alignment: Alignment.topCenter,

        decoration: BoxDecoration(
            image: DecorationImage(image: $AssetsImagesPhotosGen().logo.provider(),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.secondary.withValues(alpha: 255*0.4),
                  BlendMode.srcIn,
                )
            )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAppNavigator(),


          ],
        ),
      ),
    );
  }
}



