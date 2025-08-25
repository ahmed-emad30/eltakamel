import 'package:eltakamel/features/documents/presentation/documents_screen/ui/widgets/documents_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/main_widgets/app_scaffold.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: const DocumentsBody());
  }
}
