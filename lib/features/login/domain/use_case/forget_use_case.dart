import '../entity/login_form_entity.dart' show LoginFormEntity;
import '../repository/login_repository.dart' show LoginRepository;

class ForgetUseCase {
  final LoginRepository loginRepository;

  ForgetUseCase(this.loginRepository);

  Future<bool> call({required LoginFormEntity loginFormEntity}) async =>
      await loginRepository.forgetPassword(loginFormEntity);
}
