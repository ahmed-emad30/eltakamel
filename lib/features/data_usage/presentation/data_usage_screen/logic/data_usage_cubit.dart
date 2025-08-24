import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_usage_state.dart';

class DataUsageCubit extends Cubit<DataUsageState> {
  DataUsageCubit() : super(const DataUsageInitialState());
}
