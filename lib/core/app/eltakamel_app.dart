import 'package:eltakamel/core/app_routes/app_router.dart';
import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/core/widgets/app_screen_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/login_screen/logic/login_cubit.dart'
    show LoginCubit;
import '../../features/login/presentation/login_screen/ui/login_screen.dart';
import '../../features/splash/presentation/splash_screen/ui/splash_screen.dart'
    show SplashScreen;
import '../app_themes/themes/app_light_theme.dart';
import '../utils/service_locator.dart' show sl;

class EltakamelApp extends StatelessWidget {
  const EltakamelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(385, 812),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => sl.call<LoginCubit>(),
          child: MaterialApp.router(
            routerConfig: GoRouter(
              // initialLocation: Routes.homeScreen,
              routes: [
                GoRoute(
                  path: Routes.splashScreen,
                  builder: (context, state) => const SplashScreen(),
                ),
                GoRoute(
                  path: Routes.loginScreen,
                  builder: (context, state) => const LoginScreen(),
                ),

                /*GoRoute(
                path: Routes.homeScreen,
                builder: (context, state) => const HomeScreen(),
              ),*/
                ShellRoute(
                  builder: (context, state, child) {
                    return AppScreenNavigator(
                      path: state.matchedLocation,
                      sliver: child,
                    );
                  },
                  routes: AppRouter.generateRoute,
                ),
              ],
            ),
            debugShowCheckedModeBanner: false,
            title: 'Eltakamel',
            theme: AppLightThemes.call(),
            themeMode: ThemeMode.dark,

            // initialRoute: Routes.auth,

            /*   locale: cubit.locale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate
          ],
          localeResolutionCallback: (locale, supportedLocales) => cubit
              .getLocaleResolutionCallback(locale, supportedLocales),*/
          ),
        );
      },
    );
  }
}
