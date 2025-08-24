part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitialState extends SplashState {
  const SplashInitialState();

  @override
  List<Object> get props => [];
}

final class SplashNavigateToNextScreenState extends SplashState {
  const SplashNavigateToNextScreenState();

  @override
  List<Object> get props => [];
}
