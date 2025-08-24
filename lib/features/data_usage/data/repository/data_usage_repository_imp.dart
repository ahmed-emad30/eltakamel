import 'package:eltakamel/features/data_usage/domain/repository/data_usage_repository.dart';

import '../data_source/data_usage_remote_data_source.dart';


class DataUsageRepositoryImp implements DataUsageRepository {
  DataUsageRepositoryImp(this._remoteDataSource);

  final DataUsageRemoteDataSource _remoteDataSource;
}
