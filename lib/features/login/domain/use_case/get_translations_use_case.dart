import 'package:eltakamel/features/login/data/model/translations_model.dart';

import '../repository/login_repository.dart' show LoginRepository;

class GetTranslationsUseCase {
  final LoginRepository loginRepository;

  GetTranslationsUseCase(this.loginRepository);

  Future<TranslationsModel> call(String languageKey) async =>
      await loginRepository.getTranslations(languageKey);
}
