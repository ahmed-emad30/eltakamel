import 'package:eltakamel/features/login/presentation/login_screen/ui/widgets/login_body.dart'
    show LoginBody;
import 'package:flutter/material.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart'
    show AppScaffold;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: const LoginBody());
  }
}
