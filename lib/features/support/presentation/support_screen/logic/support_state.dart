import 'package:equatable/equatable.dart';

import '../../../domain/entity/ticket_entity.dart';

abstract class SupportState extends Equatable {
  const SupportState();
  
  @override
  List<Object?> get props => [];
}

class SupportInitial extends SupportState {}

class SupportLoading extends SupportState {}

class SupportLoaded extends SupportState {
  final List<TicketEntity> tickets;
  final bool showNewTicketForm;
  
  const SupportLoaded({
    required this.tickets,
    this.showNewTicketForm = false,
  });
  
  @override
  List<Object?> get props => [tickets, showNewTicketForm];
  
  SupportLoaded copyWith({
    List<TicketEntity>? tickets,
    bool? showNewTicketForm,
  }) {
    return SupportLoaded(
      tickets: tickets ?? this.tickets,
      showNewTicketForm: showNewTicketForm ?? this.showNewTicketForm,
    );
  }
}

class SupportError extends SupportState {
  final String message;
  
  const SupportError({required this.message});
  
  @override
  List<Object?> get props => [message];
}

class TicketCreating extends SupportState {}

class TicketCreated extends SupportState {
  final TicketEntity ticket;
  
  const TicketCreated({required this.ticket});
  
  @override
  List<Object?> get props => [ticket];
}

class TicketCreateError extends SupportState {
  final String message;
  
  const TicketCreateError({required this.message});
  
  @override
  List<Object?> get props => [message];
} 