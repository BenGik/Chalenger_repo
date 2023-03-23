import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


class BuildDashedBorder extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final double width;
  final List<double> partition;
  const BuildDashedBorder({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(0),
    this.color = Colors.white,
    this.width = 2,
    required this.partition
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding: padding,
      color: color,
      strokeWidth: width,
      dashPattern: partition,
      borderType: BorderType.Circle,
      strokeCap: StrokeCap.round,
      child: child,
    );
  }
}