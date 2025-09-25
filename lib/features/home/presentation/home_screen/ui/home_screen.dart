import 'package:eltakamel/core/api/api_request_helpers/dio_consumer.dart';
import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/features/home/presentation/home_screen/logic/drawer_cubit/drawer_cubit.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/drawer_item.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/expansion_drawer_item.dart';
import 'package:eltakamel/features/login/presentation/login_screen/logic/login_cubit.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocSelector;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/service_locator.dart' show sl;
import '../../../../../core/widgets/main_widgets/app_scaffold.dart'
    show AppScaffold;
import '../../../domain/entity/drawer_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = sl.call<LoginCubit>();
    final words = loginCubit.translations.words;
    return BlocProvider.value(
      value: sl.call<DrawerCubit>(),
      child: Directionality(
        textDirection:
            loginCubit.translations.info?.direction == 'ltr'
                ? TextDirection.ltr
                : TextDirection.rtl,
        child: AppScaffold(
          appBar: AppBar(
            backgroundColor:
                Theme.of(context).appBarTheme
                    .copyWith(backgroundColor: Colors.lightBlueAccent)
                    .backgroundColor,
            title: Text(
              words?.menuSettingsUcp ?? 'User Portal',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              PopupMenuButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  // backgroundImage: Assets.images.photos.logo.image().image,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                shape: ContinuousRectangleBorder(),
                position: PopupMenuPosition.under,
                onSelected: (value) {
                  context.go(Routes.loginScreen);
                  sl.call<DioConsumer>().clearToken();
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 'hh',
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Icon(Icons.lock, color: Colors.grey),
                          Text(
                            words?.headerLogout ?? 'Logout',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
            actionsPadding: REdgeInsetsDirectional.only(end: 8),
          ),
          backgroundColor: Colors.blueGrey.shade50,
          body: BlocSelector<DrawerCubit, DrawerState, int>(
            selector: (state) {
              return state.index;
            },
            builder: (BuildContext context, state) {
              return sl.call<DrawerCubit>().screens[state];
            },
          ),

          drawer: Drawer(
            backgroundColor: Colors.blueGrey,
            child: SafeArea(
              child: Column(
                children: [
                  DrawerItem(
                    item: DrawerEntity(
                      title: words?.headerAccount ?? 'Account',
                      icon: Icons.person,
                      page: 0,
                    ),
                  ),
                  ExpansionDrawerItem(
                    items: [
                      DrawerEntity(
                        title: words?.menuBilling ?? 'Billing',
                        icon: CupertinoIcons.book_solid,
                        page: 1,
                      ),
                      DrawerEntity(
                        title: words?.usersTabInvoices ?? 'Invoices',
                        page: 1,
                      ),
                      DrawerEntity(
                        title: words?.usersTabPayments ?? 'Payments',
                        page: 2,
                      ),
                      DrawerEntity(
                        title: words?.usersTabJournal ?? 'Journal',
                        page: 3,
                      ),
                    ],
                  ),
                  DrawerItem(
                    item: DrawerEntity(
                      title: 'Data Usage',
                      icon: Icons.area_chart,
                      page: 2,
                    ),
                  ),
                  DrawerItem(
                    item: DrawerEntity(
                      title: words?.usersTabSessions ?? 'Sessions',
                      icon: Icons.menu,
                      page: 3,
                    ),
                  ),
                  DrawerItem(
                    item: DrawerEntity(
                      title: 'Packages',
                      icon: Icons.all_inbox,
                      page: 4,
                    ),
                  ),
                  DrawerItem(
                    item: DrawerEntity(
                      title: words?.menuUsersTickets ?? 'Support',
                      icon: Icons.support,
                      page: 5,
                    ),
                  ),
                  DrawerItem(
                    item: DrawerEntity(
                      title: words?.usersTabDocuments ?? 'Documents',
                      icon: Icons.description,
                      page: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
