import 'package:eltakamel/features/login/domain/entity/login_form_entity.dart';

import '../../data/model/languages_model.dart' show LanguagesModel;
import '../../data/model/translations_model.dart' show TranslationsModel;

abstract class LoginRepository {
  Future<String> login(LoginFormEntity loginFormEntity);

  Future<bool> forgetPassword(LoginFormEntity loginFormEntity);

  Future<LanguagesModel> getLanguages();

  Future<TranslationsModel> getTranslations(String languageKey);
}