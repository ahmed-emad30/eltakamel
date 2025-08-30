import 'package:eltakamel/core/app_routes/routes_strings.dart' show Routes;
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen/ui/home_screen.dart';


class AppRouter {
  static List<GoRoute> get generateRoute {
    return [
      GoRoute(path: Routes.homeScreen,
          builder: (context, state) => const HomeScreen()),
    ];
  }
}
