import 'package:eltakamel/features/billing/domain/entity/billing_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'billing_state.dart';

class BillingCubit extends Cubit<BillingState> {
  BillingCubit() : super(const BillingInitialState());

  static BillingCubit getCubit(BuildContext context) =>
      BlocProvider.of(context);
  List<BillingDataEntity> data = [
    BillingDataEntity(
      title: 'Invoices',
      headers: [
        'Invoice No',
        'Date',
        'Amount',
        'Description',
        'DueDate',
        'Paid',
      ],
      data: [
      ]),
    BillingDataEntity(
      title: 'Payments',
      headers: [
        'Receipt No',
        'Date',
        'Type',
        'Amount',
        'Description',
      ],
      data: [],
    ),
    BillingDataEntity(
      title: 'Balance Journal',
      headers: [
        'Date',
        'CR',
        'DR',
        'Amount',
        'Balance',
        'Operation',
        'Description',
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
