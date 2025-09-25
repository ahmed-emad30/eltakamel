import 'package:eltakamel/features/home/data/model/extensions_model.dart';

import '../repository/home_repository.dart' show HomeRepository;

class GetExtensionsUseCase {
  final HomeRepository homeRepository;

  GetExtensionsUseCase(this.homeRepository);

  Future<ExtensionsModel> call(int profileId) async =>
      await homeRepository.getExtensions(profileId);
}
