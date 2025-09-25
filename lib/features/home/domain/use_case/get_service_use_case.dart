import '../../data/model/service_model.dart' show ServiceModel;
import '../repository/home_repository.dart' show HomeRepository;

class GetServiceUseCase {
  final HomeRepository homeRepository;

  GetServiceUseCase(this.homeRepository);

  Future<ServiceModel> call() async => await homeRepository.getService();
}
