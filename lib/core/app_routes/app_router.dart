import 'package:eltakamel/core/app_routes/routes_strings.dart' show Routes;
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen/ui/home_screen.dart';
import '../../features/profile/presentation/profile_screen/ui/widgets/profile_body.dart'
    show ProfileBody;

class AppRouter {
  static List<GoRoute> get generateRoute {
    return [
      GoRoute(path: Routes.homeScreen,
          builder: (context, state) => const HomeScreen()),
      GoRoute(path: Routes.profileScreen,
          builder: (context, state) => const ProfileBody()),
    ];
  }
}
