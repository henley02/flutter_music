import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///滚动列表
///[itemBuilder] item构建
///[items] 数据
///[separatorBuilder] 分割线构建
///[onItemTap] item点击事件
///[physics] 滚动类型
///[shrinkWrap] 是否根据子组件的总长度来设置ListView的长度
///[padding] 内边距
///[scrollDirection] 滚动方向
///[itemCount] item数量
Widget buildList<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Widget Function(T item, int index)? separatorBuilder,
  Function(T item, int index)? onItemTap,
  ScrollPhysics? physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry? padding,
  Axis scrollDirection = Axis.vertical,
  int? itemCount,
}) {
  return ListView.separated(
    itemBuilder: (ctx, index) {
      return GestureDetector(
        onTap: () {
          onItemTap?.call(items[index], index);
        },
        child: itemBuilder(items[index], index),
      );
    },
    separatorBuilder: (ctx, index) {
      return separatorBuilder?.call(items[index], index) ?? const SizedBox();
    },
    physics: physics,
    shrinkWrap: shrinkWrap,
    padding: padding ?? EdgeInsets.zero,
    scrollDirection: scrollDirection,
    itemCount: itemCount ?? items.length,
  );
}

///滚动列表
///[itemBuilder] item构建
///[items] 数据
///[onItemTap] item点击事件
SliverList buildSliverList<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Function(T item, int index)? onItemTap,
}) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (ctx, index) {
        return GestureDetector(
          onTap: () {
            onItemTap?.call(items[index], index);
          },
          child: itemBuilder(items[index], index),
        );
      },
      childCount: items.length,
    ),
  );
}
