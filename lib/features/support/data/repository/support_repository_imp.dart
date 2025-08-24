import '../../domain/entity/ticket_entity.dart';
import '../../domain/repository/support_repository.dart';
import '../data_source/support_remote_data_source.dart';

class SupportRepositoryImp implements SupportRepository {
  final SupportRemoteDataSource remoteDataSource;

  SupportRepositoryImp({required this.remoteDataSource});

  @override
  Future<List<TicketEntity>> getTickets() async {
    final tickets = await remoteDataSource.getTickets();
    return tickets;
  }

  @override
  Future<TicketEntity> createTicket({
    required String subject,
    required String message,
  }) async {
    final ticket = await remoteDataSource.createTicket(
      subject: subject,
      message: message,
    );
    return ticket;
  }
} 