import 'package:flutter/material.dart';

/// Custom Painter for Tooltip with Arrow
class TooltipPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.shade300
          ..style = PaintingStyle.fill;

    final path = Path();

    // Main rectangle (rounded corners)
    const radius = 6.0;
    const arrowHeight = 8.0;
    const arrowWidth = 12.0;

    // Top left corner
    path.moveTo(radius, 0);

    // Top edge
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
    );

    // Right edge
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
    );

    // Bottom edge before arrow
    path.lineTo(size.width / 2 + arrowWidth / 2, size.height);

    // Arrow pointing down
    path.lineTo(size.width / 2, size.height + arrowHeight);
    path.lineTo(size.width / 2 - arrowWidth / 2, size.height);

    // Bottom edge after arrow
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );

    // Left edge
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
    );

    path.close();

    // Draw shadow
    canvas.drawPath(
      path.shift(const Offset(2, 2)),
      Paint()
        ..color = Colors.black.withOpacity(0.1)
        ..style = PaintingStyle.fill,
    );

    // Draw main tooltip
    canvas.drawPath(path, paint);

    // Draw border
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.grey.shade400
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
