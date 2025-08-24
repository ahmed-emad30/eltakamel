import '../../domain/entity/package_entity.dart';
import '../../domain/repository/packages_repository.dart';
import '../data_source/packages_remote_data_source.dart';

class PackagesRepositoryImp implements PackagesRepository {
  final PackagesRemoteDataSource remoteDataSource;

  PackagesRepositoryImp({required this.remoteDataSource});

  @override
  Future<List<PackageEntity>> getPackages() async {
    final packages = await remoteDataSource.getPackages();
    return packages;
  }
}
