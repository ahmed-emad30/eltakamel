import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyTableWidget extends StatelessWidget {
  const EmptyTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: REdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('No Items Found'),
    );
  }
}
