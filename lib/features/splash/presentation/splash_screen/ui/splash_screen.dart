import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/features/splash/presentation/splash_screen/logic/splash_cubit.dart';
import 'package:eltakamel/features/splash/presentation/splash_screen/ui/widgets/splash_body.dart'
    show SplashBody;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return SplashCubit();
        },
        child: BlocConsumer<SplashCubit, SplashState>(
          buildWhen: (prev, state) => state is SplashInitialState,
          listenWhen: (prev, state) => state is SplashNavigateToNextScreenState,
          builder: (context, state) {
            return const SplashBody();
          },
          listener: (BuildContext context, state) {
            if (state is SplashNavigateToNextScreenState) {
              context.replace(Routes.loginScreen);
            }
          },
        ),
      ),
    );
  }
}
