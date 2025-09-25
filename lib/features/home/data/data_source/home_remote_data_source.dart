import 'package:dio/dio.dart';
import 'package:eltakamel/features/home/data/model/remaining_days_model.dart';
import 'package:eltakamel/features/home/data/model/service_model.dart';
import 'package:eltakamel/features/home/data/model/user_model.dart';

import '../../../../core/api/api_request_helpers/dio_consumer.dart';
import '../../../../core/api/api_request_helpers/end_points.dart';
import '../../../../core/utils/service_locator.dart';
import '../model/extensions_model.dart' show ExtensionsModel;

abstract class HomeRemoteDataSource {
  Future<UserModel> getUserData();

  Future<ServiceModel> getServiceData();

  Future<RemainingDaysModel> getRemainingDays();

  Future<void> redeem(String pin);

  Future<ExtensionsModel> getExtensions(int profileId);

  Future<void> changeService(int profileId);

}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  @override
  Future<UserModel> getUserData() async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.get(EndPoints.getProfile);
    final data = response?.data;
    if (data != null && data.containsKey("status") && data["status"] == 200) {
      return UserModel.fromJson(data);
    }
    throw 'Failed to get user';
  }

  @override
  Future<ServiceModel> getServiceData() async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.get(EndPoints.service);
    final data = response?.data;
    if (data != null && data.containsKey("status") && data["status"] == 200) {
      return ServiceModel.fromJson(data);
    }
    throw 'Failed to get user';
  }

  @override
  Future<RemainingDaysModel> getRemainingDays() async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.get(EndPoints.getRemainingDays);
    final data = response?.data;
    if (data != null && data.containsKey("status") && data["status"] == 200) {
      return RemainingDaysModel.fromJson(data);
    }
    throw 'Failed to get remaining days data';
  }

  @override
  Future<void> redeem(String pin) async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.post(
        EndPoints.redeem, body: FormData.fromMap({
      'pin': pin
    }));
    final data = response?.data;
    if (data != null && data.containsKey("status") &&
        data["status"] == 200) {} else {
      throw data["message"];
    }
    throw 'Failed to redeem';
  }

  @override
  Future<ExtensionsModel> getExtensions(int profileId) async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.get(
        '${EndPoints.extensions}/$profileId');
    final data = response?.data;
    if (data != null && data.containsKey("status") && data["status"] == 200) {
      return ExtensionsModel.fromJson(data);
    }
    throw 'Failed to get extensions';
  }

  @override
  Future<void> changeService(int id) async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.post(
        EndPoints.service, body: FormData.fromMap({
      'new_service': id,
      'current_password': password
    }));
    final data = response?.data;

    if (response?.statusCode == 200) {} else {
      throw data["message"];
    }
    if (response?.statusCode != 200)
      throw 'Failed to change service';
  }

}

String password = '';