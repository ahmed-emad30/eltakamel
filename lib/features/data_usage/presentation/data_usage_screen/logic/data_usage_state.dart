part of 'data_usage_cubit.dart';

sealed class DataUsageState extends Equatable {
  const DataUsageState();
}

final class DataUsageInitialState extends DataUsageState {
  const DataUsageInitialState();

  @override
  List<Object> get props => [];
}
