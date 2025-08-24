import 'package:dio/dio.dart';
import 'package:eltakamel/core/api/api_request_helpers/dio_consumer.dart';
import 'package:eltakamel/core/api/api_request_helpers/end_points.dart';

import '../../../../core/utils/service_locator.dart' show sl;

abstract class LoginRemoteDataSource {
  Future<String> login(Map<String, String> form);
}

class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  @override
  Future<String> login(Map<String, String> form) async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.post(
      EndPoints.login,
      body: FormData.fromMap(form),
    );
    final data = response?.data;
    final tokenKey = 'token';
    if (data != null && data.containsKey(tokenKey)) {
      return data[tokenKey];
    }
    throw 'Failed to login';
  }
}
