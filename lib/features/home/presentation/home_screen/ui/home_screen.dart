import 'package:eltakamel/features/billing/presentation/billing_screen/ui/widgets/billing_body.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/home_body.dart'
    show HomeBody;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart'
    show AppScaffold;

int va = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
              // backgroundImage: Assets.images.photos.logo.image().image,
              child: Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
        actionsPadding: REdgeInsetsDirectional.only(end: 8),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: screens[1],
    );
  }
}

final screens = [HomeBody(), BillingBody()];
