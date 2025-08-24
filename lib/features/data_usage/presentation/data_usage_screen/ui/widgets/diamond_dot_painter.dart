import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Custom diamond painter for chart dots
class DiamondDotPainter extends FlDotPainter {
  final double size;
  final Color color;
  final double strokeWidth;
  final Color strokeColor;

  const DiamondDotPainter({
    required this.size,
    required this.color,
    required this.strokeWidth,
    required this.strokeColor,
  });

  @override
  Color get mainColor => color;

  @override
  List<Object?> get props => [size, color, strokeWidth, strokeColor];

  @override
  FlDotPainter lerp(FlDotPainter a, FlDotPainter b, double t) {
    if (a is DiamondDotPainter && b is DiamondDotPainter) {
      return DiamondDotPainter(
        size: (a.size + (b.size - a.size) * t),
        color: Color.lerp(a.color, b.color, t) ?? color,
        strokeWidth: (a.strokeWidth + (b.strokeWidth - a.strokeWidth) * t),
        strokeColor: Color.lerp(a.strokeColor, b.strokeColor, t) ?? strokeColor,
      );
    }
    return this;
  }

  @override
  void draw(
    Canvas canvas,
    FlSpot spot,
    Offset offsetInCanvas, {
    double? size,
    Paint? paint,
  }) {
    final s = size ?? this.size;
    final path =
        Path()
          ..moveTo(offsetInCanvas.dx, offsetInCanvas.dy - s / 2)
          ..lineTo(offsetInCanvas.dx + s / 2, offsetInCanvas.dy)
          ..lineTo(offsetInCanvas.dx, offsetInCanvas.dy + s / 2)
          ..lineTo(offsetInCanvas.dx - s / 2, offsetInCanvas.dy)
          ..close();

    final fill = Paint()..color = color;
    final border =
        Paint()
          ..color = strokeColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }

  @override
  Size getSize(FlSpot spot) => Size(size, size);
}
