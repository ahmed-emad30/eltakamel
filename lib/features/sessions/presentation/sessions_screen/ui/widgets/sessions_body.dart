import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../../../../billing/presentation/billing_screen/ui/widgets/table_widget.dart'
    show TableWidget;
import '../../../../../home/presentation/home_screen/ui/widgets/home_body.dart'
    show TitleHeader;
import '../../../../../login/presentation/login_screen/logic/login_cubit.dart'
    show LoginCubit;

class SessionsBody extends StatelessWidget {
  const SessionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleHeader(title: sl
              .call<LoginCubit>()
              .translations
              .words
              ?.usersTabSessions ?? 'Login Sessions', textTheme: textTheme),
          32.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: TableWidget(
              headers: [
                sl
                    .call<LoginCubit>()
                    .translations
                    .words
                    ?.userSessionTableStarted ?? 'Started On',
                sl
                    .call<LoginCubit>()
                    .translations
                    .words
                    ?.userSessionTableEnded ?? 'Ended On',
                sl
                    .call<LoginCubit>()
                    .translations
                    .words
                    ?.userSessionTableIp ?? 'IP',
                sl
                    .call<LoginCubit>()
                    .translations
                    .words
                    ?.userSessionTableDownload ?? 'Download',
                sl
                    .call<LoginCubit>()
                    .translations
                    .words
                    ?.userSessionTableUpload ?? 'Upload',
                sl
                    .call<LoginCubit>()
                    .translations
                    .words
                    ?.userSessionTableMac ?? 'MAC',
              ],
              data: [],
            ),
          ),
        ],
      ),
    );
  }
}
