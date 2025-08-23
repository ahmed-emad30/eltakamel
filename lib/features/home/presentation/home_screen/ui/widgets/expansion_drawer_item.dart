import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entity/drawer_entity.dart';

class ExpansionDrawerItem extends StatelessWidget {
  const ExpansionDrawerItem({super.key, required this.items});

  final List<DrawerEntity> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    final firstItem = items.first;
    final otherItems = items.skip(1).toList();
    return ExpansionTile(
      title: Text(
        firstItem.title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: Colors.white),
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      leading: Icon(firstItem.icon, color: Colors.white),
      children:
          otherItems
              .map(
                (item) => ListTile(
                  leading: Icon(item.icon, color: Colors.white),
                  title: Text(
                    item.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    context.go(item.page);
                  },
                ),
              )
              .toList(),
    );
  }
}
