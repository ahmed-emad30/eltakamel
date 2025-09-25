import 'package:eltakamel/features/home/data/model/remaining_days_model.dart';

import '../repository/home_repository.dart' show HomeRepository;

class GetRemainingDaysUseCase {
  final HomeRepository homeRepository;

  GetRemainingDaysUseCase(this.homeRepository);

  Future<RemainingDaysModel> call() async =>
      await homeRepository.getRemainingDays();
}
