import 'package:eltakamel/features/login/domain/entity/login_form_entity.dart';

class LoginModel extends LoginFormEntity {
  LoginModel({
    required super.userName,
    required super.password,
    required super.language,
  });

  static Map<String, String> fromEntityToJson(LoginFormEntity entity) {
    return {
      if (entity.userName.isNotEmpty) "username": entity.userName,
      if (entity.password.isNotEmpty) "password": entity.password,
      if (entity.language.isNotEmpty) "language": entity.language,
    };
  }
}
