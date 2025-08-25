import 'package:eltakamel/features/support/presentation/support_screen/ui/widgets/support_body.dart'
    show SupportBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, BlocListener, BlocBuilder;

import '../../../../data/data_source/support_remote_data_source.dart'
    show SupportRemoteDataSourceImp;
import '../../../../data/repository/support_repository_imp.dart'
    show SupportRepositoryImp;
import '../../logic/support_cubit.dart' show SupportCubit;
import '../../logic/support_state.dart'
    show
        TicketCreated,
        TicketCreateError,
        SupportState,
        SupportLoading,
        SupportError,
        SupportLoaded,
        TicketCreating;

class SupportComponent extends StatelessWidget {
  const SupportComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SupportCubit(
            repository: SupportRepositoryImp(
              remoteDataSource: SupportRemoteDataSourceImp(),
            ),
          )..getTickets(),
      child: BlocListener<SupportCubit, SupportState>(
        listener: (context, state) {
          if (state is TicketCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ticket created successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is TicketCreateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<SupportCubit, SupportState>(
          builder: (context, state) {
            if (state is SupportLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SupportError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(state.message),
                  ],
                ),
              );
            } else if (state is SupportLoaded || state is TicketCreating) {
              final tickets =
                  state is SupportLoaded
                      ? state.tickets
                      : (state as TicketCreating);
              final showForm =
                  state is SupportLoaded ? state.showNewTicketForm : false;
              final isCreating = state is TicketCreating;

              return SupportBody(
                tickets: state is SupportLoaded ? state.tickets : [],
                showNewTicketForm: showForm,
                isCreatingTicket: isCreating,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
