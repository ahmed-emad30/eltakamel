import 'dart:developer' show log;

import 'package:eltakamel/core/utils/app_enums.dart';
import 'package:eltakamel/core/widgets/toast.dart';
import 'package:eltakamel/features/home/domain/use_case/change_service.dart';
import 'package:eltakamel/features/home/domain/use_case/get_extensions_use_case.dart';
import 'package:eltakamel/features/home/domain/use_case/redeem_use_case.dart';
import 'package:eltakamel/features/packages/data/repository/packages_repository_imp.dart';
import 'package:eltakamel/features/packages/domain/entity/package_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api/api_request_helpers/dio_consumer.dart'
    show DioConsumer;
import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../../../../packages/data/data_source/packages_remote_data_source.dart'
    show PackagesRemoteDataSourceImp;
import '../../../../data/data_source/home_remote_data_source.dart'
    show HomeRemoteDataSourceImp;
import '../../../../data/model/extensions_model.dart' show ExtensionsModel;
import '../../../../data/model/service_model.dart' show ServiceModel;
import '../../../../data/repository/home_repository_imp.dart'
    show HomeRepositoryImp;
import '../../../../domain/use_case/get_service_use_case.dart'
    show GetServiceUseCase;

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitialState()) {
    getService();
  }

  /*Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PurchaseScreen(package: PackageEntity(id: service!.profileId!, title: service.profileName??'', description: service.description, price: '${service.price??0}')),
                        ),
                      );*/
  static ServiceCubit get(ctx) => BlocProvider.of(ctx);
  final TextEditingController pinController = TextEditingController();
  final homeRepo = HomeRepositoryImp(HomeRemoteDataSourceImp());

  Future<void> getService() async {
    log('getService');
    emit(LoadServiceLoadingState());
    final homeUseCase = GetServiceUseCase(homeRepo);
    await homeUseCase
        .call()
        .then((value) async {
          emit(LoadServiceSuccessState(value));
        })
        .catchError((error) {
          log('error $error');
          emit(LoadServiceErrorState(message: error));
        });
  }

  Future<void> redeem() async {
    final pin = pinController.text;
    if (pin.isNotEmpty) {
      log('redeem');
      final homeUseCase = RedeemUseCase(homeRepo);
      await homeUseCase
          .call(pin)
          .then((value) async {
            toast('The code is valid', Status.success);
          })
          .catchError((error) {
            toast(error, Status.error);
          });
    }
  }

  Future<ExtensionsModel> getExtensions(int id) async {
    log('getService');
    final homeUseCase = GetExtensionsUseCase(homeRepo);
    return await homeUseCase
        .call(id)
        .then((value) async {
          return value;
        })
        .catchError((error) {
          toast(error, Status.error);
        });
  }

  Future<List<PackageEntity>> getPackages() async {
    log('getService');
    final repo = PackagesRepositoryImp(
      remoteDataSource: PackagesRemoteDataSourceImp(
        dioConsumer: sl.call<DioConsumer>(),
      ),
    );
    return await repo.getPackages().catchError((error) {
      toast(error, Status.error);
    });
  }

  Future<void> changeService(int profileId) async {
    final homeUseCase = ChangeServiceUseCase(homeRepo);
    await homeUseCase
        .call(profileId)
        .then((value) async {
          toast('The service is changed', Status.success);
        })
        .catchError((error) {
          log('error ${error.runtimeType} ${error}');
          toast(error, Status.error);
        });
  }
}
