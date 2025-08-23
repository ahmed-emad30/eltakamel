import 'package:eltakamel/features/billing/presentation/billing_screen/logic/billing_cubit.dart'
    show BillingCubit, BillingState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/service_locator.dart' show sl;
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
    return BlocProvider.value(
      value: sl.call<BillingCubit>(),
      child: BlocBuilder<BillingCubit, BillingState>(
        builder: (context, state) {
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
      List.generate(
        otherItems.length,
            (index) {
          final item = otherItems[index];
          return ListTile(
            leading: Icon(item.icon, color: Colors.white),
            title: Text(
              item.title,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                color: Colors.white,
              ),
            ),
            onTap: () {
              context.pop();
              context.read<BillingCubit>().changeIndex(index);
              // context.go(item.page);
            },
          );
        },
      ),
    );
        },
      ),
    );
  }
}
