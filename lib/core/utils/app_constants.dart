import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/shared/domain/entity/navigator_item_entity.dart' show NavigatorItemEntity;
import '../app_routes/routes_strings.dart' show Routes;

/// Apply this on all project
sealed class AppConstants {
  /// App Border Radius
  static const double borderRadius = 24;
  static BorderRadius borderRadiusCircular = BorderRadius.circular(
    borderRadius,
  );
  static BorderRadius borderRadiusCircularButton = BorderRadius.circular(
    borderRadius,
  );
  static BorderRadius textFormBorderRadius = BorderRadius.circular(
    borderRadius,
  );

  /// App Horizontal Padding
  static const double horizontalPadding = 16;
  static const horizontalPaddingEdge = EdgeInsets.symmetric(
    horizontal: horizontalPadding,
  );

  static const double bottomNavBarHeight = 80;

  /// App Version
  static const String appVersion = '1.0.0';
  static final List<NavigatorItemEntity> items=[
    NavigatorItemEntity(title: 'Home', route:Routes.homeScreen, unSelectedIcon: CupertinoIcons.house, selectedIcon: CupertinoIcons.house_fill),
    NavigatorItemEntity(title: 'services', route:Routes.servicesScreen,unSelectedIcon: CupertinoIcons.cube, selectedIcon: CupertinoIcons.cube_fill),
    NavigatorItemEntity(title: 'All Projects', route:Routes.allProjectsScreen,unSelectedIcon: Icons.work_outline, selectedIcon: Icons.work),
    NavigatorItemEntity(title: 'profile', route:Routes.profileScreen,unSelectedIcon: CupertinoIcons.person, selectedIcon: CupertinoIcons.person_fill),
  ];
}
