part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState extends Equatable {
  final int index;

  const DrawerState({this.index = 0});
}

final class DrawerInitial extends DrawerState {
  @override
  List<Object?> get props => [];
}

final class ChangeIndexState extends DrawerState {
  const ChangeIndexState(int index) : super(index: index);

  @override
  List<Object?> get props => [index];
}
