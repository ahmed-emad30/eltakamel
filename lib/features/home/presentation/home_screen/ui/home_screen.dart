import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/features/billing/presentation/billing_screen/ui/widgets/billing_body.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/drawer_item.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/expansion_drawer_item.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/home_body.dart' show HomeBody;
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart' show AppScaffold;
import '../../../../documents/presentation/documents_screen/ui/widgets/documents_body.dart';
import '../../../domain/entity/drawer_entity.dart';
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
        backgroundColor: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: Colors.lightBlueAccent,
        ).backgroundColor,
        title:  Text('User Portal', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},

            icon: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              // backgroundImage: Assets.images.photos.logo.image().image,
              child: Icon(Icons.person, color: Colors.black,),

            ),
          )
        ],
        actionsPadding: REdgeInsetsDirectional.only(end: 8),

      ),
        backgroundColor: Colors.blueGrey.shade50,
      body: screens[1],
        drawer: Drawer(
          backgroundColor: Colors.blueGrey,
          child:
              SafeArea(
                child: Column(
                  children: [
                   DrawerItem(item: DrawerEntity(title: 'Account', icon: Icons.person, page:Routes.homeScreen ),) ,
                    ExpansionDrawerItem(
                      items: [
                        const DrawerEntity(title: 'Billing', icon: CupertinoIcons.book_solid, page:Routes.homeScreen ),
                        const DrawerEntity(title: 'Invoices',  page:Routes.homeScreen ),
                        const DrawerEntity(title: 'Payments',  page: Routes.homeScreen),
                        const DrawerEntity(title: 'Journal',  page:Routes.homeScreen ),
                      ],
                    ),
                    DrawerItem(item: DrawerEntity(title: 'Data Usage', icon: Icons.area_chart, page: Routes.homeScreen),) ,
                    DrawerItem(item: DrawerEntity(title: 'Sessions', icon: Icons.menu, page: Routes.homeScreen),) ,
                    DrawerItem(item: DrawerEntity(title: 'Packages', icon:Icons.all_inbox , page: Routes.homeScreen),) ,
                    DrawerItem(item: DrawerEntity(title: 'Support', icon: Icons.support, page:Routes.homeScreen ),) ,
                    DrawerItem(item: DrawerEntity(title: 'Documents', icon: Icons.description, page: Routes.homeScreen),) ,



                  ],
                ),
              ),
        ),
    );
  }
}

final screens = [
  HomeBody(),
  BillingBody(),
  DocumentsBody(),
];

