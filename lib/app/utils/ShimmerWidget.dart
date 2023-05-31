import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWIdget extends StatelessWidget {
  final double width;
  final double? height;
  final ShapeBorder shapeBorder;

  const ShimmerWIdget.rectangular({this.width = double.infinity, this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerWIdget.circular(
      {this.width = double.infinity,
      this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[300]!,
        period: Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400],
            shape: shapeBorder,
          ),
        ),
      );
}
