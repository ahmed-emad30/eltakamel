part of 'remaining_cubit.dart';

sealed class RemainingState extends Equatable {
  const RemainingState();
}

final class RemainingInitialState extends RemainingState {
  const RemainingInitialState();

  @override
  List<Object> get props => [];
}

final class LoadRemainingLoadingState extends RemainingState {
  @override
  List<Object?> get props => [];
}

final class LoadRemainingSuccessState extends RemainingState {
  const LoadRemainingSuccessState(this.remaining);

  final RemainingDaysModel remaining;

  @override
  List<Object> get props => [remaining];
}

final class LoadRemainingErrorState extends RemainingState {
  final String message;

  const LoadRemainingErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
