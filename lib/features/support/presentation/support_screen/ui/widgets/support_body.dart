import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/ticket_entity.dart';
import '../../logic/support_cubit.dart';
import 'new_ticket_form.dart';
import 'ticket_item.dart';

class SupportBody extends StatelessWidget {
  final List<TicketEntity> tickets;
  final bool showNewTicketForm;
  final bool isCreatingTicket;

  const SupportBody({
    super.key,
    required this.tickets,
    required this.showNewTicketForm,
    required this.isCreatingTicket,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFF5F8FB),
        child: Column(
          children: [
            // New Ticket Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: showNewTicketForm
                    ? null
                    : () => context.read<SupportCubit>().showNewTicketForm(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'New Ticket',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // New Ticket Form (if visible)
            if (showNewTicketForm) 
              NewTicketForm(isLoading: isCreatingTicket),

            // Tickets List
            if (tickets.isEmpty && !showNewTicketForm)
              const SizedBox(height: 100) // Blank space when no tickets
            else if (tickets.isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: tickets
                      .map((ticket) => TicketItem(ticket: ticket))
                      .toList(),
                ),
              ),
              
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
} 