import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class TicketCard extends StatelessWidget {
  TicketCard(
      {this.lineFromTop = 0,
      this.lineRadius = 10,
      this.lineColor,
      this.child,
      this.decoration,
      this.radius});

  final double lineFromTop;

  final double lineRadius;

  final Widget? child;

  final TicketDecoration? decoration;

  final Color? lineColor;

  final double? radius;

  @override
  Widget build(BuildContext context) {
    SemiCircleClipper clipper = SemiCircleClipper(
        radius: lineRadius, fromTop: lineFromTop, circularRadius: radius);
    return CustomPaint(
      child: ClipPath(
        clipper: clipper,
        child: child ?? SizedBox(),
      ),
      foregroundPainter: SeparatorPainter(
          clipper: clipper,
          fromTop: lineFromTop,
          radius: lineRadius,
          color: lineColor),
      painter: ShadowPainter(clipper: clipper, decoration: decoration),
    );
  }
}

class SemiCircleClipper extends CustomClipper<Path> {
  SemiCircleClipper({this.fromTop, this.radius, this.circularRadius});

  final double? fromTop;

  final double? radius;

  final double? circularRadius;

  @override
  Path getClip(Size size) {
    var path = Path();
    path
      ..moveTo(0, 0)
      ..lineTo(0, 0)
      // //TOP_LEFT_BEZIER
      ..lineTo(20.0, 0.0)
      ..quadraticBezierTo(0.0, 0.0, 0.0, 20.0)
      ..addRRect(RRect.zero)
      ..lineTo(0, max(fromTop! - radius!, 0))
      ..arcToPoint(Offset(radius!, fromTop!),
          clockwise: true, radius: Radius.circular(radius!))
      ..arcToPoint(Offset(0, fromTop! + radius!),
          clockwise: true, radius: Radius.circular(radius!))

      //BOTTOM-LEFT_BEZIER

      ..lineTo(0.0, size.height - 20)
      ..quadraticBezierTo(0.0, size.height, 20.0, size.height)
      // ..lineTo(0, size.height)
      // ..lineTo(size.width, size.height)

      //BOTTOM_RIGHT_BEZIER
      ..lineTo(size.width - 20.0, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - 20)
      ..lineTo(size.width, fromTop! + radius!)
      ..arcToPoint(Offset(size.width - radius!, fromTop!),
          clockwise: true, radius: Radius.circular(radius!))
      ..arcToPoint(Offset(size.width, max(fromTop! - radius!, 0)),
          radius: Radius.circular(radius!))

      //TOP_RIGHT_BEZIER

      ..lineTo(size.width, 15.0)
      ..quadraticBezierTo(size.width, 0.0, size.width - 15.0, 0.0)
      // ..lineTo(size.width, 0)
      ..close();
    return path;

    // var path = new Path();
    // path.lineTo(0.0, size.height - 20);
    // path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    // path.lineTo(size.width - 20.0, size.height);

    // path.quadraticBezierTo(
    //     size.width, size.height, size.width, size.height - 20);
    // path.lineTo(size.width, 0.0);

    // path.quadraticBezierTo(size.width + 12, 20.0, size.width - 8.0, 0.0);

    // return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}

class ShadowPainter extends CustomPainter {
  ShadowPainter({
    this.clipper,
    TicketDecoration? decoration,
  }) : _decoration = decoration ?? TicketDecoration();

  final CustomClipper<Path>? clipper;

  final TicketDecoration _decoration;

  TicketBorder? get _border => _decoration.border;

  @override
  void paint(Canvas canvas, Size size) {
    if (_border != null) {
      if (_border!.style == TicketBorderStyle.none) return;
      Paint paint = Paint()
        ..color = _border!.color ?? Colors.black
        ..strokeWidth = _border!.width ?? 0.5
        ..style = PaintingStyle.stroke;
      Path path = clipper!.getClip(size);
      switch (_border!.style!) {
        case TicketBorderStyle.none:
          return;
        case TicketBorderStyle.solid:
          break;
        case TicketBorderStyle.dotted:
          path = dashPath(path,
              dashArray: CircularIntervalList<double>(<double>[5, 5]));
          break;
      }
      canvas.drawPath(path, paint);
    }

    _decoration.shadow.forEach((e) {
      canvas.drawShadow(
          clipper!.getClip(size), e.color!, e.elevation ?? 0, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class SeparatorPainter extends CustomPainter {
  SeparatorPainter({
    this.clipper,
    this.fromTop,
    this.radius,
    this.color,
  });
  final CustomClipper<Path>? clipper;

  final double? radius;

  final double? fromTop;

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    if (fromTop == 0) return;
    Paint paint = Paint()
      ..color = color ?? Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path = Path()
      ..moveTo(radius! + 5, fromTop!)
      ..lineTo(size.width - radius! - 5, fromTop!);

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList<double>(<double>[5, 5])),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TicketShadow {
  TicketShadow({
    this.color,
    this.elevation,
  });

  final Color? color;

  final double? elevation;
}

enum TicketBorderStyle { none, solid, dotted }

class TicketBorder {
  TicketBorder({
    this.color,
    this.width,
    this.style,
  });
  final Color? color;
  final double? width;
  final TicketBorderStyle? style;
}

class TicketDecoration {
  TicketDecoration({
    this.shadow = const [],
    this.border,
  });

  final List<TicketShadow> shadow;

  final TicketBorder? border;
}
