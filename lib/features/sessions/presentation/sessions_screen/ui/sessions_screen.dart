import 'package:eltakamel/features/sessions/presentation/sessions_screen/ui/widgets/sessions_body.dart'
    show SessionsBody;
import 'package:flutter/material.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart'
    show AppScaffold;

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: const SessionsBody());
  }
}
