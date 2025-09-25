import '../repository/home_repository.dart' show HomeRepository;

class ChangeServiceUseCase {
  final HomeRepository homeRepository;

  ChangeServiceUseCase(this.homeRepository);

  Future<void> call(int profileId) async =>
      await homeRepository.changeService(profileId);
}
