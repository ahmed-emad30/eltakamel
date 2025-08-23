import 'package:eltakamel/features/billing/presentation/billing_screen/logic/billing_cubit.dart';
import 'package:eltakamel/features/billing/presentation/billing_screen/ui/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../../../../home/presentation/home_screen/ui/widgets/home_body.dart'
    show TitleHeader;

class BillingBody extends StatelessWidget {
  const BillingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: BlocProvider.value(
        value: sl.call<BillingCubit>(),
        child: BlocBuilder<BillingCubit, BillingState>(
          builder: (context, state) {
            final cubit = BillingCubit.getCubit(context);
            final dataItem = cubit.data[cubit.currentIndex];
            return Column(
              children: [
                TitleHeader(title: dataItem.title, textTheme: textTheme),
                32.verticalSpace,

                TableWidget(
                  headers: dataItem.headers,
                  data: dataItem.data,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
