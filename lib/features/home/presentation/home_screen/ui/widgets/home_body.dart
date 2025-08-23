import 'package:eltakamel/core/app_themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../gen/assets.gen.dart' show Assets;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleHeader(textTheme: textTheme, title: 'Account Information',),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Assets.images.photos.logo.image(),
                16.verticalSpace,
                InfoCard(textTheme: textTheme, title:'0 day(s)', subTitle: 'REMAINING DAYS', icon: Icons.work,),
                InfoCard(textTheme: textTheme, title:'200.00 MB', subTitle: 'REMAINING TRAFFIC', icon: Icons.download,),
                InfoCard(textTheme: textTheme, title:'LD 0.00', subTitle: 'ACCOUNT BALANCE', icon: Icons.money,),
                InfoCard(textTheme: textTheme, title:'0', subTitle: 'UNPAID INVOICES', icon: Icons.description,),
                CustomerInfoSection(textTheme: textTheme),
                Container(
                  width: double.infinity,
                  // height: 100.h,
                  padding: REdgeInsets.all(16),
                  margin: REdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400, width: 0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SectionHeader(textTheme: textTheme, title: 'Service Information',),
                      InfoItem(title: 'Current Service', value: 'Magic Plus Package - 200GB',),
                      InfoItem(title: 'Service Description', value: 'N/A',),
                      InfoItem(title: 'Subscription', value: 'Expired',valueColor: Colors.red,),
                      InfoItem(title: 'Expiration', value: '2025-07-06 17:16:27',valueFontWeight: FontWeight.bold,),
                      InfoItem(title: 'Status', value: 'OFFLINE',valueColor: Colors.brown.shade200,valueFontWeight: FontWeight.bold,),
                      InfoItem(title: 'Service Price', value: 'LD 120.00',),
                      InfoItem(title: 'Remaining Traffic', value: 'N/A',valueUnderlineDecoration: TextDecoration.underline,),
                      InfoItem(title: 'Static IP', value: 'N/A',valueUnderlineDecoration: TextDecoration.underline,),
                      InfoItem(title: 'Auto Renew', value: 'N/A',valueUnderlineDecoration: TextDecoration.underline,),
                   Divider(),
                      CustomButton(textTheme: textTheme, title: 'Redeem Code', onPressed: () {  },),
                      CustomButton(textTheme: textTheme, title: 'Activate Account', onPressed: () {  },),
                      CustomButton(textTheme: textTheme, title: 'Extend Service', onPressed: () {  },),
                      CustomButton(textTheme: textTheme, title: 'Change Service', onPressed: () {  },),

                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textTheme, required this.title, required this.onPressed,
  });

  final TextTheme textTheme;
final String title;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,

          fixedSize: Size(1.sw, 40.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(title, style: textTheme.titleLarge!.copyWith(color: Colors.blueAccent.shade400),));
  }
}

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100.h,
      padding: REdgeInsets.all(16),
      margin: REdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SectionHeader(textTheme: textTheme, title: 'Customer Information',),
          InfoItem(title: 'ID', value: '1232',),
          InfoItem(title: 'Customer Name', value: 'تطبيق التكامل',),
          InfoItem(title: 'Username', value: 'test',),
          InfoItem(title: 'Account Balance', value: 'LD 0.00',valueFontWeight: FontWeight.bold,),
          InfoItem(title: 'Debts', value: 'LD 0.00',valueFontWeight: FontWeight.bold,),
          InfoItem(title: 'Email', value: 'N/A',valueColor: Colors.blue,),
          InfoItem(title: 'Phone', value: 'N/A',valueUnderlineDecoration: TextDecoration.underline,),
          InfoItem(title: 'Address', value: 'N/A',valueUnderlineDecoration: TextDecoration.underline,),
          InfoItem(title: 'Company', value: 'N/A',valueUnderlineDecoration: TextDecoration.underline,),
          InfoItem(title: 'Contract ID', value: '',),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.textTheme, required this.title,
  });

  final TextTheme textTheme;
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: textTheme.titleLarge),
        Divider(),
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key, required this.title, required this.value, this.valueColor, this.valueFontWeight,  this.valueUnderlineDecoration=TextDecoration.none,
  });
final String title;
final String value;
final Color? valueColor;
final FontWeight? valueFontWeight;
final TextDecoration valueUnderlineDecoration ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpandedText(text: title,style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Colors.grey.shade600,
          height: 3
        ),),
        ExpandedText(text: value,style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color:valueColor ?? AppColors.black,
          fontWeight: valueFontWeight,
          decoration: valueUnderlineDecoration,
        ),),
      ],
    );
  }
}

class ExpandedText extends StatelessWidget {
  const ExpandedText({
    super.key, required this.text, this.style,
  });
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(text,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ));
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.textTheme,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final TextTheme textTheme;
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100.h,
      padding: REdgeInsets.all(16),
      margin: REdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.titleLarge),
              4.verticalSpace,
              Text(
                subTitle,
                style: textTheme.bodySmall!.copyWith(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Icon(icon, color: Colors.grey),
        ],
      ),
    );
  }
}

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key, required this.textTheme, required this.title});

  final String title;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 50.h,
      padding: REdgeInsetsDirectional.only(start: 16),
      color: Colors.white,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: textTheme?.headlineSmall!.copyWith(color: Colors.grey),
      ),
    );
  }
}
