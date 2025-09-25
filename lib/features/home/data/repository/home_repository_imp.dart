import 'package:eltakamel/features/home/data/model/extensions_model.dart';
import 'package:eltakamel/features/home/data/model/remaining_days_model.dart';
import 'package:eltakamel/features/home/data/model/user_model.dart';

import '../../domain/repository/home_repository.dart' show HomeRepository;
import '../data_source/home_remote_data_source.dart' show HomeRemoteDataSource;
import '../model/service_model.dart' show ServiceModel;

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<UserModel> getUser() async {
    return await _remoteDataSource.getUserData().then((value) {
      return value;
    });
  }

  @override
  Future<ServiceModel> getService() async {
    return await _remoteDataSource.getServiceData().then((value) {
      return value;
    });
  }

  @override
  Future<RemainingDaysModel> getRemainingDays() async {
    return await _remoteDataSource.getRemainingDays().then((value) {
      return value;
    });
  }

  @override
  Future<void> redeem(String pin) async {
    await _remoteDataSource.redeem(pin).catchError((error) {
      throw error;
    });
  }

  @override
  Future<ExtensionsModel> getExtensions(int profileId) async {
    return await _remoteDataSource.getExtensions(profileId).then((value) {
      return value;
    });
  }

  @override
  Future<void> changeService(int profileId) async {
    return await _remoteDataSource.changeService(profileId).then((value) {
      return value;
    });
  }
}
