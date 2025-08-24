part of 'shared_cubit.dart';

sealed class SharedState extends Equatable {
  const SharedState({this.index = 0});

  final int index;
}

final class SharedInitialState extends SharedState {
  const SharedInitialState();

  @override
  List<Object> get props => [];
}

final class ChangeIndexState extends SharedState {
  const ChangeIndexState(this.index) : super(index: index);
  @override
  final int index;
  @override
  List<Object> get props => [index];
}
