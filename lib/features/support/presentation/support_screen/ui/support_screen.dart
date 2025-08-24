import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart';
import '../../../data/data_source/support_remote_data_source.dart';
import '../../../data/repository/support_repository_imp.dart';
import '../logic/support_cubit.dart';
import '../logic/support_state.dart';
import 'widgets/support_body.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(
        repository: SupportRepositoryImp(
          remoteDataSource: SupportRemoteDataSourceImp(),
        ),
      )..getTickets(),
      child: AppScaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context)
              .appBarTheme
              .copyWith(backgroundColor: Colors.lightBlueAccent)
              .backgroundColor,
          title: Text(
            'User Portal',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, color: Colors.black),
              ),
            )
          ],
          actionsPadding: REdgeInsetsDirectional.only(end: 8),
        ),
        backgroundColor: Colors.blueGrey.shade50,
        showAppDrawer: true,
        body: BlocListener<SupportCubit, SupportState>(
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
                final tickets = state is SupportLoaded 
                    ? state.tickets 
                    : (state as TicketCreating);
                final showForm = state is SupportLoaded 
                    ? state.showNewTicketForm 
                    : false;
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
      ),
    );
  }
} 