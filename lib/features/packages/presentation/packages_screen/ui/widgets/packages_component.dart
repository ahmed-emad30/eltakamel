import 'package:eltakamel/features/packages/presentation/packages_screen/ui/widgets/packages_body.dart'
    show PackagesBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;

import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../logic/packages_cubit.dart' show PackagesCubit;
import '../../logic/packages_state.dart'
    show PackagesState, PackagesLoading, PackagesError, PackagesLoaded;

class PackagesComponent extends StatelessWidget {
  const PackagesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PackagesCubit>()..getPackages(),
      child: BlocBuilder<PackagesCubit, PackagesState>(
        builder: (context, state) {
          if (state is PackagesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PackagesError) {
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
          } else if (state is PackagesLoaded) {
            return PackagesBody(packages: state.packages);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
