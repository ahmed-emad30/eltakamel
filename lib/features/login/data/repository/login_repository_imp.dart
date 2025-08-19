
import 'package:eltakamel/features/login/domain/entity/login_form_entity.dart';

import '../../domain/repository/login_repository.dart' show LoginRepository;
import '../data_source/login_remote_data_source.dart' show LoginRemoteDataSource;
import '../model/login_model.dart' show LoginModel;


 class LoginRepositoryImp implements LoginRepository  {
  LoginRepositoryImp(this._remoteDataSource);
 
  final LoginRemoteDataSource _remoteDataSource;

  @override
  Future<String> login(LoginFormEntity loginFormEntity) async{
   final form = LoginModel.fromEntityToJson(loginFormEntity);
 return await _remoteDataSource.login(form);

  }
}