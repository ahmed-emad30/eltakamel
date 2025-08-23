import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart';

import '../../../../../billing/presentation/billing_screen/ui/widgets/billing_body.dart'
    show BillingBody;
import '../../ui/widgets/home_body.dart' show HomeBody;

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  final screens = [
    HomeBody(),
    BillingBody(),
    // SessionsBody(),
  ];

  // int currentIndex = 0;

  void changeIndex(int index) {
    // currentIndex = index;
    emit(ChangeIndexState(index));
  }
}
