import '../../domain/repository/sessions_repository.dart'
    show SessionsRepository;
import '../data_source/sessions_remote_data_source.dart'
    show SessionsRemoteDataSource;

class SessionsRepositoryImp implements SessionsRepository {
  SessionsRepositoryImp(this._remoteDataSource);

  final SessionsRemoteDataSource _remoteDataSource;
}
