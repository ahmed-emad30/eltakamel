import 'package:eltakamel/features/data_usage/presentation/data_usage_screen/ui/data_usage_screen.dart';
import 'package:eltakamel/features/packages/presentation/packages_screen/ui/packages_screen.dart';
import 'package:eltakamel/features/support/presentation/support_screen/ui/support_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:eltakamel/core/app_routes/routes_strings.dart' show Routes;

import '../../features/home/presentation/home_screen/ui/home_screen.dart';
import '../../features/profile/presentation/profile_screen/ui/widgets/profile_body.dart'
    show ProfileBody;

class AppRouter {
  static List<GoRoute> get generateRoute {
    return [
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.profileScreen,
        builder: (context, state) => const ProfileBody(),
      ),
      GoRoute(
        path: Routes.dataUsageScreen,
        builder: (context, state) => const DataUsageScreen(),
      ),
      GoRoute(
        path: Routes.packagesScreen,
        builder: (context, state) => const PackagesScreen(),
      ),
      GoRoute(
        path: Routes.supportScreen,
        builder: (context, state) => const SupportScreen(),
      ),
    ];
  }
}
