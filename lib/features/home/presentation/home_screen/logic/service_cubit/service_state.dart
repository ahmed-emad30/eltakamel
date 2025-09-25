part of 'service_cubit.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();
}

final class ServiceInitialState extends ServiceState {
  const ServiceInitialState();

  @override
  List<Object> get props => [];
}

final class LoadServiceLoadingState extends ServiceState {
  @override
  List<Object?> get props => [];
}

final class LoadServiceSuccessState extends ServiceState {
  const LoadServiceSuccessState(this.service);

  final ServiceModel service;

  @override
  List<Object> get props => [service];
}

final class LoadServiceErrorState extends ServiceState {
  final String message;

  const LoadServiceErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
