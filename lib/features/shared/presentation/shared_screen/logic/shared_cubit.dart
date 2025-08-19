import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart' show sl;

part 'shared_state.dart';

class SharedCubit extends Cubit<SharedState> {
  SharedCubit() : super(const SharedInitialState());
void changeIndex(int index) {
    emit(ChangeIndexState(index));

  }


}
