import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eltakamel/core/api/api_request_helpers/dio_consumer.dart';
import 'package:eltakamel/core/api/api_request_helpers/end_points.dart';
import 'package:eltakamel/features/login/data/model/languages_model.dart';
import 'package:eltakamel/features/login/data/model/translations_model.dart';

import '../../../../core/utils/service_locator.dart' show sl;

abstract class LoginRemoteDataSource {
  Future<String>login(Map<String,String>form);

  Future<bool> forgetPassword(Map<String, String> form);

  Future<LanguagesModel> getLanguages();

  Future<TranslationsModel> getTranslations(String languageKey);
}

class LoginRemoteDataSourceImp implements LoginRemoteDataSource  {
  @override
  Future<String> login(Map<String, String> form) async{
final dioConsumer = sl.call<DioConsumer>();
final response =await dioConsumer.post(EndPoints.login,body: FormData.fromMap(form),);
final data =  response?.data ;
final tokenKey = 'token';
if(data != null && data.containsKey(tokenKey)){
  return data[tokenKey];
  
}
throw 'Failed to login';
  }

  @override
  Future<bool> forgetPassword(Map<String, String> form) async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.post(
      EndPoints.forgotPassword,
      body: FormData.fromMap(form),
    );
    final data = response?.data;
    if (data != null && data.containsKey('status')) {
      if ('${data['status']}' == '200') {
        return true;
      }
    }
    return false;
  }

  @override
  Future<LanguagesModel> getLanguages() async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.get(EndPoints.languages);
    final data = response?.data;
    if (data != null && data.containsKey("status") && data["status"] == 200) {
      return LanguagesModel.fromJson(data);
    }
    throw 'Failed to get languages';
  }

  @override
  Future<TranslationsModel> getTranslations(String languageKey) async {
    final dioConsumer = sl.call<DioConsumer>();
    final response = await dioConsumer.get(
      '${EndPoints.translations}/$languageKey',
    );
    final data = jsonDecode(response?.data);

    if (data != null && data.containsKey('words')) {
      return TranslationsModel.fromJson(data);
    }
    throw 'Failed to get translations';
  }
}