
import '../../domain/repository/splash_repository.dart' show SplashRepository;
import '../data_source/splash_remote_data_source.dart' show SplashRemoteDataSource;


 class SplashRepositoryImp implements SplashRepository  {
  SplashRepositoryImp(this._remoteDataSource);
 
  final SplashRemoteDataSource _remoteDataSource;
}