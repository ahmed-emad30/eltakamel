import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/support_repository.dart';
import 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  final SupportRepository repository;

  SupportCubit({required this.repository}) : super(SupportInitial());

  Future<void> getTickets() async {
    try {
      emit(SupportLoading());
      final tickets = await repository.getTickets();
      emit(SupportLoaded(tickets: tickets));
    } catch (e) {
      emit(SupportError(message: e.toString()));
    }
  }

  void showNewTicketForm() {
    if (state is SupportLoaded) {
      final currentState = state as SupportLoaded;
      emit(currentState.copyWith(showNewTicketForm: true));
    }
  }

  void hideNewTicketForm() {
    if (state is SupportLoaded) {
      final currentState = state as SupportLoaded;
      emit(currentState.copyWith(showNewTicketForm: false));
    }
  }

  Future<void> createTicket({
    required String subject,
    required String message,
  }) async {
    try {
      emit(TicketCreating());
      
      if (subject.length < 5) {
        emit(const TicketCreateError(message: 'Subject must be at least 5 characters'));
        return;
      }
      
      if (message.length < 10) {
        emit(const TicketCreateError(message: 'Message must be at least 10 characters'));
        return;
      }

      final ticket = await repository.createTicket(
        subject: subject,
        message: message,
      );
      
      emit(TicketCreated(ticket: ticket));
      // this dlay is between the creation of the ticket and the refresh of the tickets list
      await Future.delayed(const Duration(milliseconds: 300));
      await getTickets();
      
    } catch (e) {
      emit(TicketCreateError(message: e.toString()));
    }
  }
} 