import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltakamel/core/utils/extensions.dart';
import 'package:eltakamel/core/widgets/main_widgets/app_text.dart';
import 'package:eltakamel/core/widgets/main_widgets/primary_button.dart';

/// TODO : Error and Success image
sealed class AppDialogs {
  static void showErrorDialog(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText(
            message,
            // style: AppTextStyle.style18Weight600,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                // textStyle: AppTextStyle.style16Weight600,
              ),
              child: const AppText('Ok'),
            ),
          ],
        );
      },
    );
  }

  static void showNotAuthorizationDialog(
    BuildContext context, {
    String? message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              // AppAssetsImage(
              //   AppAsset.errorImage,
              //   height: 160.sp,
              //   width: 160.sp,
              // ),
              5.verticalSpace,
              AppText(
                // message ?? LocaleKeys.pleaseLoginToContinue.tr(),
                '',
                // style: AppTextStyle.style12Light,
              ),
            ],
          ),
          actions: [
            // PrimaryButton.expand(
            //   ///TODO: navigate to login
            //   onPressed: () => context.pushNamed(RoutesStrings.splashScreen),
            //   text: LocaleKeys.login.tr(),
            // ),
          ],
        );
      },
    );
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String message,
    Function()? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              // AppAssetsImage(
              //   AppAsset.successImage,
              //   height: 160.sp,
              //   width: 160.sp,
              // ),
              5.verticalSpace,
              AppText(
                message,
                // style: AppTextStyle.style16Weight600,
              ),
            ],
          ),
          actions: [
            PrimaryButton.expand(
              onPressed: onPressed ?? () => context.pop(),
              // text: LocaleKeys.ok.tr(),
              text: 'LocaleKeys.ok.tr()',
            ),
          ],
        );
      },
    );
  }
}
