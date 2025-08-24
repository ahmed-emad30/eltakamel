import 'package:flutter/material.dart';

import 'tooltip_painter.dart';

/// Custom Tooltip Widget with Arrow
class CustomTooltipWidget extends StatelessWidget {
  final int day;
  final String total;

  const CustomTooltipWidget({
    super.key,
    required this.day,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TooltipPainter(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          12,
          8,
          12,
          8,
        ), 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$day',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '• Total: $total',
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
