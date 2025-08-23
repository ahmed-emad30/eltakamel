import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../billing/presentation/billing_screen/ui/widgets/table_widget.dart'
    show TableWidget;
import '../../../../../home/presentation/home_screen/ui/widgets/home_body.dart'
    show TitleHeader;

class SessionsBody extends StatelessWidget {
  const SessionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleHeader(title: 'Login Sessions', textTheme: textTheme),
          32.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: TableWidget(
              headers: [
                'Started On',
                'Ended On',
                'IP',
                'Download',
                'Upload',
                'MAC',
              ],
              data: [],
            ),
          ),
        ],
      ),
    );
  }
}
