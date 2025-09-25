part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object> get props => [];
}

final class LoadUserLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

final class LoadUserSuccessState extends HomeState {
  const LoadUserSuccessState(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

final class LoadUserErrorState extends HomeState {
  final String message;

  const LoadUserErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
