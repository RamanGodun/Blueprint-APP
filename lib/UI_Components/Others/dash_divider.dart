import 'package:flutter/material.dart';

class DashedLineDivider extends StatelessWidget {
  final Color? color;

  const DashedLineDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:
          DashedLinePainter(color: color ?? Theme.of(context).dividerColor),
      child: Container(
        height: 1.0,
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.3
      ..style = PaintingStyle.stroke;

    const dashWidth = 1.5;
    const dashSpace = 2.0;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0.0),
        Offset(startX + dashWidth, 0.0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
