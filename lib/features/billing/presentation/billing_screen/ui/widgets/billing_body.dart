import 'package:eltakamel/features/billing/presentation/billing_screen/logic/billing_cubit.dart';
import 'package:eltakamel/features/billing/presentation/billing_screen/ui/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../home/presentation/home_screen/ui/widgets/home_body.dart'
    show TitleHeader;

class BillingBody extends StatelessWidget {
  const BillingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => BillingCubit(),
        child: BlocBuilder<BillingCubit, BillingState>(
          builder: (context, state) {
            final cubit = BillingCubit.getCubit(context);
            return Column(
              children: [
                TitleHeader(title: 'Invoices', textTheme: textTheme),
                32.verticalSpace,

                TableWidget(
                  headers: cubit.data[cubit.currentIndex].headers,
                  data: cubit.data[cubit.currentIndex].data,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
