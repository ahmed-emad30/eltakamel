import 'package:equatable/equatable.dart';

import '../../../domain/entity/package_entity.dart';

abstract class PackagesState extends Equatable {
  const PackagesState();

  @override
  List<Object?> get props => [];
}

class PackagesInitial extends PackagesState {}

class PackagesLoading extends PackagesState {}

class PackagesEmpty extends PackagesState {}

class PackagesLoaded extends PackagesState {
  final List<PackageEntity> packages;

  const PackagesLoaded({required this.packages});

  @override
  List<Object?> get props => [packages];
}

class PackagesError extends PackagesState {
  final String message;

  const PackagesError({required this.message});

  @override
  List<Object?> get props => [message];
}
