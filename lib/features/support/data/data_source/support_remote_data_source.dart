import '../model/ticket_model.dart';

abstract class SupportRemoteDataSource {
  Future<List<TicketModel>> getTickets();
  Future<TicketModel> createTicket({
    required String subject,
    required String message,
  });
}

class SupportRemoteDataSourceImp implements SupportRemoteDataSource {
  // Local storage for tickets (in real app, this would be API calls)
  static final List<TicketModel> _tickets = [];

  @override
  Future<List<TicketModel>> getTickets() async {
    //TODO: the api implementation will be here
    // simuation for loading data for noww
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Return only created tickets
    return List.from(_tickets);
  }

  @override
  Future<TicketModel> createTicket({
    required String subject,
    required String message,
  }) async {
    //TODO: the api implementation will be here
    // simuation for loading data for noww
    await Future.delayed(const Duration(milliseconds: 500));
    
    // simuation for success creationn
    final newTicket = TicketModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: subject,
      status: 'OPEN',
      priority: 'UNSOLVED',
      createdAt: DateTime.now(),
    );
    
   
    _tickets.add(newTicket);
    
    return newTicket;
  }
} 