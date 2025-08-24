import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart';
import '../../../../../core/utils/service_locator.dart';
import '../logic/packages_cubit.dart';
import '../logic/packages_state.dart';
import 'widgets/packages_body.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PackagesCubit>()..getPackages(),
      child: AppScaffold(
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).appBarTheme
                  .copyWith(backgroundColor: Colors.lightBlueAccent)
                  .backgroundColor,
          title: Text(
            'User Portal',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, color: Colors.black),
              ),
            ),
          ],
          actionsPadding: REdgeInsetsDirectional.only(end: 8),
        ),
        backgroundColor: Colors.blueGrey.shade50,
        showAppDrawer: true,
        body: BlocBuilder<PackagesCubit, PackagesState>(
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
      ),
    );
  }
}
