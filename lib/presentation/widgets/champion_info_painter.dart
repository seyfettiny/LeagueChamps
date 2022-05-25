import 'package:flutter/material.dart';

class ChampInfoPainter extends CustomPainter {
  final double info;
  final double animation;
  ChampInfoPainter({
    required this.info,
    required this.animation,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xffAA771C),
          Color(0xffc6a66a),
          Color(0xffFCF6BA),
        ],
        stops: [
          0.0,
          0.5,
          1.0,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo((info * animation) * size.width / 10, size.height / 2);
    canvas.drawPath(path, paint);
    final paint2 = Paint()
      ..color = const Color(0xffc6a66a)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    final path2 = Path();
    path2.moveTo(0, size.height / 2);
    path2.lineTo(size.width * info, size.height / 2);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(ChampInfoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ChampInfoPainter oldDelegate) => false;
}
