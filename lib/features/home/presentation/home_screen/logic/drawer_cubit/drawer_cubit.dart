import 'package:eltakamel/features/documents/presentation/documents_screen/ui/widgets/documents_body.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:meta/meta.dart';

import '../../../../../billing/presentation/billing_screen/ui/widgets/billing_body.dart'
    show BillingBody;
import '../../../../../data_usage/presentation/data_usage_screen/ui/widgets/data_usage_body.dart'
    show DataUsageBody;
import '../../../../../packages/presentation/packages_screen/ui/widgets/packages_component.dart'
    show PackagesComponent;
import '../../../../../sessions/presentation/sessions_screen/ui/widgets/sessions_body.dart'
    show SessionsBody;
import '../../../../../support/presentation/support_screen/ui/widgets/support_component.dart'
    show SupportComponent;
import '../../ui/widgets/home_body.dart' show HomeBody;

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  final screens = [
    HomeBody(),
    BillingBody(),
    DataUsageBody(),
    SessionsBody(),
    PackagesComponent(),
    SupportComponent(),
    DocumentsBody(),
  ];

  // int currentIndex = 0;

  void changeIndex(int index) {
    // currentIndex = index;
    emit(ChangeIndexState(index));
  }
}
