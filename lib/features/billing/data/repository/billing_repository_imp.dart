import '../../domain/repository/billing_repository.dart' show BillingRepository;
import '../data_source/billing_remote_data_source.dart'
    show BillingRemoteDataSource;

class BillingRepositoryImp implements BillingRepository {
  BillingRepositoryImp(this._remoteDataSource);

  final BillingRemoteDataSource _remoteDataSource;
}
