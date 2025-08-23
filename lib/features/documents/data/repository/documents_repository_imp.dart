import '../../domain/repository/documents_repository.dart';
import '../data_source/documents_remote_data_source.dart';

class DocumentsRepositoryImp implements DocumentsRepository {
  DocumentsRepositoryImp(this._remoteDataSource);

  final DocumentsRemoteDataSource _remoteDataSource;
}
