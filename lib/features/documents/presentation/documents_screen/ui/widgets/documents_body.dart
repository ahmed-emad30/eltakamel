import 'package:eltakamel/features/billing/presentation/billing_screen/ui/widgets/table_widget.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/service_locator.dart' show sl;
import '../../../../../login/presentation/login_screen/logic/login_cubit.dart'
    show LoginCubit;

class DocumentsBody extends StatelessWidget {
  const DocumentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loginCubit = sl.call<LoginCubit>();
    final words = loginCubit.translations.words;
    return ListView(
      children: [
        TitleHeader(
          textTheme: textTheme,
          title: words?.usersTabDocuments ?? 'User Documents',
        ),
        32.verticalSpace,
        Container(
          color: Colors.white,
          margin: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: REdgeInsetsDirectional.only(
                  start: 16,
                  end: 16,
                  top: 8,
                ),
                alignment: AlignmentDirectional.centerStart,
                child: PopupMenuButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.lightBlue.shade300,
                    ),
                    shape: WidgetStatePropertyAll(ContinuousRectangleBorder()),
                  ),
                  // icon: Icon(Icons.settings),
                  // iconColor: Colors.white,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.w,
                    children: [
                      Icon(Icons.settings, color: Colors.white),
                      Text(
                        words?.globalTableActions ?? 'Actions',
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                  shape: ContinuousRectangleBorder(),
                  position: PopupMenuPosition.under,
                  itemBuilder:
                      (ctx) => [
                        PopupMenuItem(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8,

                            children: [
                              Icon(Icons.download),
                              Text(words?.globalLabelDownload ?? 'Download'),
                            ],
                          ),
                        ),
                      ],
                ),
              ),
              TableWidget(
                headers: [
                  words?.userDocumentTableName ?? 'Document Name',
                  words?.userDocumentTableSize ?? 'Size',
                  words?.userDocumentTableDate ?? 'Date',
                ],
                data: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
