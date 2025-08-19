import 'package:eltakamel/features/login/domain/entity/login_form_entity.dart';

abstract class LoginRepository {
  Future<String> login(LoginFormEntity loginFormEntity);
}