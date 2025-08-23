part of 'billing_cubit.dart';

sealed class BillingState extends Equatable {
  const BillingState();
}

final class BillingInitialState extends BillingState {
  const BillingInitialState();

  @override
  List<Object> get props => [];
}

final class ChangeIndex {
  final int index;

  const ChangeIndex({required this.index});

  List<Object> get props => [index];
}
