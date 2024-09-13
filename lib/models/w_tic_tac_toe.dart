import 'package:flutter/material.dart';

class HashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint hashPaint = Paint();
    hashPaint.color = Colors.green;
    hashPaint.style = PaintingStyle.stroke;
    hashPaint.strokeWidth = 8;

    //draw #
    final hash = Path();
    hash.moveTo(size.width * 0.333, 0);
    hash.relativeLineTo(0, size.height);
    hash.moveTo(size.width * 0.666, 0);
    hash.relativeLineTo(0, size.height);
    hash.moveTo(0, size.width * 0.333);
    hash.relativeLineTo(size.width, 0);
    hash.moveTo(0, size.width * 0.666);
    hash.relativeLineTo(size.width, 0);
    canvas.drawPath(hash, hashPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //draw X
    Paint signPaint = Paint();
    signPaint.color = Colors.blue;
    signPaint.style = PaintingStyle.stroke;
    signPaint.strokeWidth = 3;

    final cross = Path();
    cross.moveTo(25, 25);
    cross.relativeLineTo(50, 50);
    cross.moveTo(75, 25);
    cross.relativeLineTo(-50, 50);
    canvas.drawPath(cross, signPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //draw circle
    Paint signPaint = Paint();
    signPaint.color = Colors.blue;
    signPaint.style = PaintingStyle.stroke;
    signPaint.strokeWidth = 3;
    const circleRadius = 30.0;
    var circleCenter = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(circleCenter, circleRadius, signPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class EmptyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //draw X
    Paint signPaint = Paint();
    signPaint.color = Colors.blue;
    signPaint.style = PaintingStyle.stroke;
    signPaint.strokeWidth = 3;

    final cross = Path();
    cross.moveTo(25, 25);
    cross.relativeLineTo(50, 50);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}