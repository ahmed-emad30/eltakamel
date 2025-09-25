import 'dart:developer' show log;

import 'package:eltakamel/features/home/data/model/user_model.dart';
import 'package:eltakamel/features/home/domain/use_case/get_user_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/home_remote_data_source.dart';
import '../../../data/repository/home_repository_imp.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState()) {
    getUser();
  }

  final homeRepo = HomeRepositoryImp(HomeRemoteDataSourceImp());

  Future<void> getUser() async {
    log('getUser');
    emit(LoadUserLoadingState());
    final homeUseCase = GetUserUseCase(homeRepo);
    await homeUseCase
        .call()
        .then((value) async {
          emit(LoadUserSuccessState(value));
        })
        .catchError((error) {
          log('error $error');
          emit(LoadUserErrorState(message: error));
        });
  }
}
