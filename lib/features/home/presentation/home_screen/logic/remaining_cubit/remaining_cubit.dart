import 'dart:developer' show log;

import 'package:bloc/bloc.dart';
import 'package:eltakamel/features/home/data/model/remaining_days_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/data_source/home_remote_data_source.dart'
    show HomeRemoteDataSourceImp;
import '../../../../data/repository/home_repository_imp.dart'
    show HomeRepositoryImp;
import '../../../../domain/use_case/get_remaining_use_case.dart';

part 'remaining_state.dart';

class RemainingCubit extends Cubit<RemainingState> {
  RemainingCubit() : super(RemainingInitialState()) {
    getRemaining();
  }

  final homeRepo = HomeRepositoryImp(HomeRemoteDataSourceImp());

  Future<void> getRemaining() async {
    log('getRemaining');
    emit(LoadRemainingLoadingState());
    final homeUseCase = GetRemainingDaysUseCase(homeRepo);
    await homeUseCase
        .call()
        .then((value) async {
          emit(LoadRemainingSuccessState(value));
        })
        .catchError((error) {
          log('error $error');
          emit(LoadRemainingErrorState(message: error));
        });
  }
}
