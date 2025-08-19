import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../features/shared/presentation/shared_screen/logic/shared_cubit.dart'
    show SharedCubit, SharedState;
import '../app_themes/colors/app_colors.dart' show AppColors;
import '../utils/app_constants.dart' show AppConstants;
import '../utils/service_locator.dart' show sl;

class Footer extends StatelessWidget {
  const Footer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      color: AppColors.scaffoldBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
        AppConstants.items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          final isSelected = index == i;
          return IconButton(
            icon: Icon(
              isSelected ? item.selectedIcon : item.unSelectedIcon,
              size: 25.sp,
              color:
              isSelected
                  ? AppColors.primary
                  : AppColors.lightGreyColor,
            ),
            onPressed: () {
              context.go(item.route);
              sl<SharedCubit>().changeIndex(i);

            },
          );
        }).toList(),
      ),
    );
  }
}
