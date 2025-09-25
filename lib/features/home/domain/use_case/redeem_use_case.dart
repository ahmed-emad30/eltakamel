import '../repository/home_repository.dart' show HomeRepository;

class RedeemUseCase {
  final HomeRepository homeRepository;

  RedeemUseCase(this.homeRepository);

  Future<void> call(String pin) async => await homeRepository.redeem(pin);
}
