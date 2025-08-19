import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/core/app_themes/colors/app_colors.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/home_body.dart';

import '../../../gen/assets.gen.dart' show Assets;

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final String? appBarTitle;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? sidebar;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.padding,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.floatingActionButtonLocation,
    this.sidebar, this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    final logoSize = 30.dm;
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: Padding(padding: padding ?? EdgeInsets.zero, child: CustomScrollView(
        slivers: [
/*
          SliverAppBar(
            backgroundColor: AppColors.scaffoldBackground,
            leading: Container(
              width: logoSize,
              height: logoSize,
              alignment: Alignment.center,
              child:
              Row(

                children: [
                  Assets.images.photos.logo.image(
                    width: logoSize,
                    height: logoSize,
                    // fit: BoxFit.cover,
                  ),
                  // SubTitle(title: '  Solutions',)
                ],
              ),
            ),
            leadingWidth: 0.3.sw,
            title: appBarTitle != null ? Text(appBarTitle!,

              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white
              ),
            ) : null,
            centerTitle: true,
            actions: [
              */
/*TextButton(
                child:  Text("En",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white
                  ),
                ),
                onPressed: () {

                },
              ),*//*

              InkWell(
                customBorder: CircleBorder(),
                child: const Icon(Icons.notifications_active_outlined, color: AppColors.white),
                onTap: () {
                  context.push(Routes.notificationsScreen);
                  // Implement search functionality
                },
              ),
            ],

          ),
*/
          SliverFillRemaining(child: body),
          // if (sidebar != null) SliverToBoxAdapter(child: sidebar!),
        ],
      )),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      endDrawer: endDrawer,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButtonLocation:
      floatingActionButtonLocation ?? FloatingActionButtonLocation.centerDocked,
    );


  }
}
