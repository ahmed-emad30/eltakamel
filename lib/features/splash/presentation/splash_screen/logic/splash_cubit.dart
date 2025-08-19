import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitialState())  {
     init();
  }

  Future<void> init() async {
    await animateLogo();
  }

  Future<void> animateLogo() async {
    await Future.delayed(
      const Duration(seconds: 1),

    );
    if (!isClosed) {
      navigateToNextScreen();
    }
  }

  void navigateToNextScreen() {
    emit(const SplashNavigateToNextScreenState());
  }
  @override
  Future<void> close() {
    // navigateToNextScreen();
    return super.close();
  }
}
