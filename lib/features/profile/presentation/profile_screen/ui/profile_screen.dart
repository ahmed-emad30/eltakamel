import 'package:eltakamel/features/profile/presentation/profile_screen/ui/widgets/profile_body.dart'
    show ProfileBody;
import 'package:flutter/material.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart'
    show AppScaffold;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: const ProfileBody());
  }
}
