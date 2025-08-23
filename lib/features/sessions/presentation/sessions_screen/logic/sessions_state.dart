part of 'sessions_cubit.dart';

sealed class SessionsState extends Equatable {
  const SessionsState();
}

final class SessionsInitialState extends SessionsState {
  const SessionsInitialState();

  @override
  List<Object> get props => [];
}
