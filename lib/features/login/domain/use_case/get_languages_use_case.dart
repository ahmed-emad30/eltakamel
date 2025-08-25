import 'package:eltakamel/features/login/data/model/languages_model.dart';

import '../repository/login_repository.dart' show LoginRepository;

class GetLanguagesUseCase {
  final LoginRepository loginRepository;

  GetLanguagesUseCase(this.loginRepository);

  Future<LanguagesModel> call() async => await loginRepository.getLanguages();
}
