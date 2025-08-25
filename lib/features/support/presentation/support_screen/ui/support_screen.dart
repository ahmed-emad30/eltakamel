import 'package:eltakamel/features/support/presentation/support_screen/ui/widgets/support_component.dart'
    show SupportComponent;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .appBarTheme
            .copyWith(backgroundColor: Colors.lightBlueAccent)
            .backgroundColor,
        title: Text(
          'User Portal',
          style: Theme
              .of(context)
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
      // showAppDrawer: true,
      body: SupportComponent(),
    );
  }
}

