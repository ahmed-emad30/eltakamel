import '../entity/login_form_entity.dart' show LoginFormEntity;
import '../repository/login_repository.dart' show LoginRepository;

class LoginUseCase{
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);
  Future<String> call({required LoginFormEntity loginFormEntity}) async=>await loginRepository.login( loginFormEntity);
}