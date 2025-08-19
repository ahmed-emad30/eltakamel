
import '../../domain/repository/profile_repository.dart' show ProfileRepository;
import '../data_source/profile_remote_data_source.dart' show ProfileRemoteDataSource;


 class ProfileRepositoryImp implements ProfileRepository  {
  ProfileRepositoryImp(this._remoteDataSource);
 
  final ProfileRemoteDataSource _remoteDataSource;
}