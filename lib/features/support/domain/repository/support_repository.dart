import '../entity/ticket_entity.dart';

abstract class SupportRepository {
  Future<List<TicketEntity>> getTickets();
  Future<TicketEntity> createTicket({
    required String subject,
    required String message,
  });
} 