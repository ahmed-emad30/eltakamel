part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitialState extends ProfileState {
  const ProfileInitialState();

  @override
  List<Object> get props => [];
}
