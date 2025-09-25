import 'package:eltakamel/features/billing/domain/entity/billing_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart' show sl;
import '../../../../login/presentation/login_screen/logic/login_cubit.dart'
    show LoginCubit;

part 'billing_state.dart';

class BillingCubit extends Cubit<BillingState> {
  BillingCubit() : super(const BillingInitialState());

  static BillingCubit getCubit(BuildContext context) =>
      BlocProvider.of(context);
  List<BillingDataEntity> data = [
    BillingDataEntity(
        title: sl
            .call<LoginCubit>()
            .translations
            .words
            ?.managersTabInvoices ?? 'Invoices',
      headers: [
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userInvoiceTableNumber ?? 'Invoice No',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userInvoiceTableDate ?? 'Date',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userInvoiceTableAmount ?? 'Amount',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userInvoiceTableDescription ?? 'Description',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userInvoiceTableDate ?? 'DueDate',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userInvoiceTablePaid ?? 'Paid',
      ],
      data: [
      ]),
    BillingDataEntity(
      title: sl
          .call<LoginCubit>()
          .translations
          .words
          ?.managersTabPayments ?? 'Payments',
      headers: [
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userReceiptTableNo ?? 'Receipt No',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userReceiptTableDate ?? 'Date',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userReceiptTableType ?? 'Type',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userReceiptTableAmount ?? 'Amount',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userReceiptTableDescription ?? 'Description',
      ],
      data: [],
    ),
    BillingDataEntity(
      title: sl
          .call<LoginCubit>()
          .translations
          .words
          ?.managersTableBalance ?? 'Balance Journal',
      headers: [
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableDate ?? 'Date',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableCr ?? 'CR',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableDr ?? 'DR',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableAmount ?? 'Amount',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableBalance ?? 'Balance',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableOperation ?? 'Operation',
        sl
            .call<LoginCubit>()
            .translations
            .words
            ?.userJournalTableDescription ?? 'Description',
      ],
      data: [],
    ),
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState(currentIndex));
  }

  getData() {}
}
