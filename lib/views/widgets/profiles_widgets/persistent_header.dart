import 'package:flutter/material.dart';


class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader({
    @override required this.minHeight,
    @override required this.maxHeight,
    required this.child
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}