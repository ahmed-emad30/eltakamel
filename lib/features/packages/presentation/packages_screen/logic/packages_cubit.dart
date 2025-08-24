import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/packages_repository.dart';
import 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final PackagesRepository repository;

  PackagesCubit({required this.repository}) : super(PackagesInitial());

  Future<void> getPackages() async {
    try {
      emit(PackagesLoading());
      final packages = await repository.getPackages();
      emit(PackagesLoaded(packages: packages));
    } catch (e) {
      emit(PackagesError(message: e.toString()));
    }
  }
}
