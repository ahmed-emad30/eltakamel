import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../../../domain/entity/drawer_entity.dart';
import '../../logic/drawer_cubit/drawer_cubit.dart' show DrawerCubit;

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.item});

  final DrawerEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon, color: Colors.white),
      title: Text(
        item.title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: Colors.white),
      ),
      onTap: () {
        // context.go(item.page);
        context.pop();
        sl.call<DrawerCubit>().changeIndex(item.page);
      },
    );
  }
}
