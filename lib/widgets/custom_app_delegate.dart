import 'dart:math';

import 'package:flutter/cupertino.dart';

class CustomAppDelegate extends SliverPersistentHeaderDelegate {
  CustomAppDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  final double maxHeight;
  final double minHeight;
  final Widget child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent;
  }
}
