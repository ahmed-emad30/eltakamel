import 'package:eltakamel/features/login/data/model/languages_model.dart';
import 'package:eltakamel/features/login/data/model/translations_model.dart';
import 'package:eltakamel/features/login/domain/entity/login_form_entity.dart';

import '../../../../core/api/api_request_helpers/dio_consumer.dart'
    show DioConsumer;
import '../../../../core/utils/service_locator.dart' show sl;
import '../../domain/repository/login_repository.dart' show LoginRepository;
import '../data_source/login_remote_data_source.dart' show LoginRemoteDataSource;
import '../model/login_model.dart' show LoginModel;


 class LoginRepositoryImp implements LoginRepository  {
  LoginRepositoryImp(this._remoteDataSource);
 
  final LoginRemoteDataSource _remoteDataSource;

  @override
  Future<String> login(LoginFormEntity loginFormEntity) async{
   final form = LoginModel.fromEntityToJson(loginFormEntity);
    return await _remoteDataSource.login(form).then((value) {
      sl.call<DioConsumer>().setToken(value);
      return value;
    });
  }

  @override
  Future<bool> forgetPassword(LoginFormEntity loginFormEntity) async {
    final form = LoginModel.fromEntityToJson(loginFormEntity);
    return await _remoteDataSource.forgetPassword(form);
  }

  @override
  Future<LanguagesModel> getLanguages() async {
    return await _remoteDataSource.getLanguages();
  }

  @override
  Future<TranslationsModel> getTranslations(String languageKey) async {
    return await _remoteDataSource.getTranslations(languageKey);
  }
}