import 'package:eltakamel/core/app_themes/colors/app_colors.dart';
import 'package:eltakamel/core/utils/app_enums.dart';
import 'package:eltakamel/core/widgets/toast.dart';
import 'package:eltakamel/features/home/presentation/home_screen/logic/home_cubit.dart';
import 'package:eltakamel/features/home/presentation/home_screen/logic/remaining_cubit/remaining_cubit.dart';
import 'package:eltakamel/features/home/presentation/home_screen/logic/service_cubit/service_cubit.dart';
import 'package:eltakamel/features/login/data/model/translations_model.dart';
import 'package:eltakamel/features/packages/domain/entity/package_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../../../../../gen/assets.gen.dart' show Assets;
import '../../../../../login/presentation/login_screen/logic/login_cubit.dart'
    show LoginCubit;
import '../../../../../packages/presentation/packages_screen/ui/purchase_screen.dart'
    show PurchaseScreen;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loginCubit = sl.call<LoginCubit>();
    final words = loginCubit.translations.words;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleHeader(
              textTheme: textTheme,
              title: words?.managerProfileLabelAccount ?? 'Account Information',
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Assets.images.photos.logo.image(),
                  16.verticalSpace,
                  Statistics(textTheme: textTheme, words: words),
                  CustomerInfoSection(textTheme: textTheme),
                  PackageSection(textTheme: textTheme, words: words),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  const Statistics({super.key, required this.textTheme, required this.words});

  final TextTheme textTheme;
  final Words? words;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemainingCubit(),
      child: BlocBuilder<RemainingCubit, RemainingState>(
        builder: (context, state) {
          if (state is LoadRemainingLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadRemainingErrorState) {
            return ErrorWidget(state.message);
          } else if (state is LoadRemainingSuccessState) {
            final remaining = state.remaining.data;
            return Column(
              children: [
                InfoCard(
                  textTheme: textTheme,
                  title: '${remaining?.remainingDays ?? 0} day(s)',
                  subTitle:
                  words?.userCancellationRemainingDays ?? 'REMAINING DAYS',
                  icon: Icons.work,
                ),
                InfoCard(
                  textTheme: textTheme,
                  title: '${remaining?.remainingTraffic ?? 0.00} MB',
                  subTitle:
                  words?.userOverviewRemainingTraffic ??
                      'REMAINING TRAFFIC',
                  icon: Icons.download,
                ),
                InfoCard(
                  textTheme: textTheme,
                  title: 'LD ${remaining?.balance ?? 0.00}',
                  subTitle: 'ACCOUNT BALANCE',
                  icon: Icons.money,
                ),
                InfoCard(
                  textTheme: textTheme,
                  title: '${remaining?.unpaidInvoices ?? 0}',
                  subTitle: 'UNPAID INVOICES',
                  icon: Icons.description,
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class PackageSection extends StatelessWidget {
  const PackageSection({
    super.key,
    required this.textTheme,
    required this.words,
  });

  final TextTheme textTheme;
  final Words? words;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (ctx, state) {
          if (state is LoadServiceLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadServiceErrorState) {
            return ErrorWidget(state.message);
          } else if (state is LoadServiceSuccessState) {
            final service = state.service.data;
            final cubit = ServiceCubit.get(ctx);
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
                  SectionHeader(
                    textTheme: textTheme,
                    title: 'Service Information',
                  ),
                  InfoItem(
                    title: 'Current Service',
                    value: service?.profileName ?? 'N/A',
                  ),
                  InfoItem(
                    title: 'Service Description',
                    value: service?.description ?? 'N/A',
                  ),
                  InfoItem(
                    title: 'Subscription',
                    value: service?.subscription ?? 'Expired',
                    valueColor:
                    service?.subscription == 'Active'
                        ? AppColors.green
                        : Colors.red,
                  ),
                  InfoItem(
                    title: 'Expiration',
                    value: service?.expiration ?? 'N/A',
                    valueFontWeight: FontWeight.bold,
                  ),
                  InfoItem(
                    title: 'Status',
                    value: service?.status == true ? 'ONLINE' : 'OFFLINE',

                    valueColor: Colors.brown.shade200,
                    valueFontWeight: FontWeight.bold,
                  ),
                  InfoItem(
                    title: 'Service Price',
                    value: 'LD ${service?.price ?? 0.0}',
                  ),
                  InfoItem(
                    title: 'Remaining Traffic',
                    value: 'N/A',
                    valueUnderlineDecoration: TextDecoration.underline,
                  ),
                  InfoItem(
                    title: 'Static IP',
                    value: 'N/A',
                    valueUnderlineDecoration: TextDecoration.underline,
                  ),
                  InfoItem(
                    title: 'Auto Renew',
                    value: 'N/A',
                    valueUnderlineDecoration: TextDecoration.underline,
                  ),
                  Divider(),
                  CustomButton(
                    textTheme: textTheme,
                    title: 'Redeem Code',
                    onPressed: () {
                      showDialog(
                        context: context,

                        builder: (ctx) {
                          final border = OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                          );
                          final errorBorder = border.copyWith(
                            borderSide: BorderSide(color: Colors.red),
                          );
                          return Dialog(
                            insetPadding: REdgeInsets.all(8),

                            child: RPadding(
                              padding: REdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                spacing: 16.h,
                                children: [
                                  Text(
                                    'Enter Card Number',
                                    style: textTheme.headlineMedium!.copyWith(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: cubit.pinController,
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text?.isEmpty ?? true) {
                                        return 'You need to fill the input';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: border,
                                      enabledBorder: border,
                                      disabledBorder: border,
                                      focusedBorder: border,
                                      focusedErrorBorder: errorBorder,
                                      errorBorder: errorBorder,
                                    ),
                                  ),
                                  // 8.verticalSpace,
                                  Row(
                                    spacing: 16.w,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (cubit
                                              .pinController
                                              .text
                                              .isEmpty) {
                                            toast(
                                              'You need to fill the input',
                                              Status.info,
                                            );
                                          } else {
                                            await cubit.redeem();

                                            GoRouter.of(context).pop();
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                          WidgetStatePropertyAll(
                                            Colors.blue,
                                          ),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.r),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Ok',
                                          style: textTheme.labelLarge!.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          GoRouter.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                          WidgetStatePropertyAll(
                                            Colors.grey,
                                          ),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.r),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: textTheme.labelMedium!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  CustomButton(
                    textTheme: textTheme,
                    title: 'Activate Account',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (_) =>
                              PurchaseScreen(
                                package: PackageEntity(
                                  id: service!.profileId!,
                                  title: service.profileName ?? '',
                                  description: service.description ?? 'N/A',
                                  price: '${service.price ?? 0}',
                                ),
                              ),
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    textTheme: textTheme,
                    title: words?.userExtendFormTitle ?? 'Extend Service',
                    onPressed: () async {
                      final extensions = await cubit.getExtensions(service!
                          .profileId!);
                      showDialog(
                        context: context,
                        builder:
                            (context) =>
                            Dialog(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RPadding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PopupMenuButton<int>(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text('Select service extensions',
                                            style: textTheme.headlineSmall!
                                                .copyWith(
                                                color: Colors.blueGrey),),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                      onSelected: (value) {
                                        GoRouter.of(context).pop();
                                      },
                                      itemBuilder: (context) =>
                                          List.generate(
                                              extensions.data?.length ?? 0, (
                                              index) =>
                                              PopupMenuItem(
                                                value: extensions.data![index]
                                                    .id,
                                                child: Text(
                                                    '${extensions.data![index]
                                                        .name!}${extensions
                                                        .data![index]
                                                        .price} LD'),)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                  ),
                  CustomButton(
                    textTheme: textTheme,
                    title: 'Change Service',
                    onPressed: () async {
                      final packages = await cubit.getPackages();
                      showDialog(
                        context: context,
                        builder:
                            (context) {
                          PackageEntity selected = packages.first;
                          return Dialog(
                            child: RPadding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Current service : ${service?.profileName ??
                                        ''}',
                                    style: textTheme.headlineSmall!.copyWith(
                                        color: Colors.blueGrey),),

                                  PopupMenuButton<PackageEntity>(

                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('New Service',
                                          style: textTheme.labelLarge!.copyWith(
                                              color: Colors.blueGrey),),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                    onSelected: (value) {
                                      selected = value;
                                    },
                                    itemBuilder: (context) =>
                                        List.generate(
                                            packages.length, (index) =>
                                            PopupMenuItem(
                                              value: packages[index],
                                              child: Text(
                                                  packages[index].title),)),
                                  ),

                                  Center(
                                    child: ElevatedButton(onPressed: () async {
                                      await cubit.changeService(
                                          service!.profileId!);
                                      GoRouter.of(context).pop();
                                    },
                                        style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(
                                                Colors.blue)
                                        ),
                                        child: Text('Change',
                                          style: textTheme.labelLarge!.copyWith(
                                              color: Colors.white),)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textTheme,
    required this.title,
    required this.onPressed,
  });

  final TextTheme textTheme;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,

        fixedSize: Size(1.sw, 40.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Text(
        title,
        style: textTheme.titleLarge!.copyWith(
          color: Colors.blueAccent.shade400,
        ),
      ),
    );
  }
}

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LoadUserLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadUserErrorState) {
          return ErrorWidget(state.message);
        } else if (state is LoadUserSuccessState) {
          final user = state.user.data;
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
                SectionHeader(
                  textTheme: textTheme,
                  title: 'Customer Information',
                ),
                InfoItem(title: 'ID', value: '${user?.id}'),
                InfoItem(title: 'Customer Name', value: user?.name ?? ''),
                InfoItem(title: 'Username', value: user?.username ?? ''),
                InfoItem(
                  title: 'Account Balance',
                  value: 'LD ${user?.balance}',
                  valueFontWeight: FontWeight.bold,
                ),
                InfoItem(
                  title: 'Debts',
                  value: 'LD ${user?.loanBalance}',
                  valueFontWeight: FontWeight.bold,
                ),
                InfoItem(
                  title: 'Email',
                  value: user?.email ?? 'N/A',
                  valueColor: Colors.blue,
                ),
                InfoItem(
                  title: 'Phone',
                  value: user?.phone ?? 'N/A',
                  valueUnderlineDecoration: TextDecoration.underline,
                ),
                InfoItem(
                  title: 'Address',
                  value: user?.address ?? 'N/A',
                  valueUnderlineDecoration: TextDecoration.underline,
                ),
                InfoItem(
                  title: 'Company',
                  value: user?.company ?? 'N/A',
                  valueUnderlineDecoration: TextDecoration.underline,
                ),
                InfoItem(
                  title: 'Contract ID',
                  value: '${user?.contractId ?? ''}',
                ),
              ],
            ),
          );
        } else
          return SizedBox();
      },
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.textTheme,
    required this.title,
  });

  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [Text(title, style: textTheme.titleLarge), Divider()],
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
    this.valueFontWeight,
    this.valueUnderlineDecoration = TextDecoration.none,
  });

  final String title;
  final String value;
  final Color? valueColor;
  final FontWeight? valueFontWeight;
  final TextDecoration valueUnderlineDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpandedText(
          text: title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Colors.grey.shade600,
            height: 3,
          ),
        ),
        ExpandedText(
          text: value,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: valueColor ?? AppColors.black,
            fontWeight: valueFontWeight,
            decoration: valueUnderlineDecoration,
          ),
        ),
      ],
    );
  }
}

class ExpandedText extends StatelessWidget {
  const ExpandedText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: style ?? Theme.of(context).textTheme.bodyMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
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
