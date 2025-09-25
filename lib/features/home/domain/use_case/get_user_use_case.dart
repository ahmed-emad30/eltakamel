import '../../data/model/user_model.dart' show UserModel;
import '../repository/home_repository.dart' show HomeRepository;

class GetUserUseCase {
  final HomeRepository homeRepository;

  GetUserUseCase(this.homeRepository);

  Future<UserModel> call() async => await homeRepository.getUser();
}
