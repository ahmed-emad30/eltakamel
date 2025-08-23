part of 'billing_cubit.dart';

sealed class BillingState extends Equatable {
  const BillingState({this.index = 0});

  final int index;
}

final class BillingInitialState extends BillingState {
  const BillingInitialState();

  @override
  List<Object> get props => [];
}

final class ChangeIndexState extends BillingState {
  const ChangeIndexState(int index) : super(index: index);

  @override
  List<Object?> get props => [index];
}
