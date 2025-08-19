part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitialState extends LoginState {
  const LoginInitialState();
  
  @override
  List<Object> get props => [];
}

final class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}
final class LoginErrorState extends LoginState {
  final String message;
  const LoginErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
