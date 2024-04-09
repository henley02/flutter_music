import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildGrid<T>({
  required List<T> items,
  int crossAxisCount = 2,
  double crossAxisSpacing = 10,
  double mainAxisSpacing = 10,
  double childAspectRatio = 0.7,
  required Widget Function(T item, int index) itemBuilder,
  EdgeInsetsGeometry? padding,
  Function(T item, int index)? onTap,
}) {
  return GridView.builder(
    itemCount: items.length,
    padding: padding ?? EdgeInsets.zero,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
    ),
    itemBuilder: (ctx, index) {
      return GestureDetector(
        onTap: () {
          onTap?.call(items[index], index);
        },
        child: itemBuilder(items[index], index),
      );
    },
  );
}

SliverGrid buildSliverGrid<T>({
  required List<T> items,
  int crossAxisCount = 3,
  double crossAxisSpacing = 10,
  double mainAxisSpacing = 10,
  double childAspectRatio = 0.7,
  required Widget Function(T item, int index) itemBuilder,
  Function(T item, int index)? onTap,
}) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (ctx, index) {
        return GestureDetector(
          onTap: () {
            onTap?.call(items[index], index);
          },
          child: itemBuilder(items[index], index),
        );
      },
      childCount: items.length,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
    ),
  );
}
