import 'package:flutter/material.dart';

class FlexibleDetailBar extends StatelessWidget {
  final Widget content;
  final Widget background;
  final Widget Function(BuildContext context, double t)? builder;

  const FlexibleDetailBar({
    Key? key,
    required this.content,
    required this.background,
    this.builder,
  }) : super(key: key);

  static double percentage(BuildContext context) {
    _FlexibleDetail? value =
        context.dependOnInheritedWidgetOfExactType<_FlexibleDetail>();
    assert(value != null, 'ooh , can not find');
    return value!.t;
  }

  Widget build(BuildContext context) {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final List<Widget> children = <Widget>[];
    final double deltaExtent = settings!.maxExtent - settings.minExtent;
    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final double t =
        (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
            .clamp(0.0, 1.0);

    //背景添加视差滚动效果
    children.add(
      Positioned(
        top: -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t),
        left: 0,
        right: 0,
        height: settings.maxExtent,
        child: background,
      ),
    );

    //为content 添加 底部的 padding
    double bottomPadding = 0;
    SliverAppBar? sliverAppBar =
        context.findAncestorWidgetOfExactType<SliverAppBar>();
    if (sliverAppBar?.bottom != null) {
      bottomPadding = sliverAppBar!.bottom!.preferredSize.height;
    }
    children.add(
      Positioned(
        top: settings.currentExtent - settings.maxExtent,
        left: 0,
        right: 0,
        height: settings.maxExtent,
        child: Opacity(
          opacity: 1 - t,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: DefaultTextStyle(
                style: Theme.of(context).primaryTextTheme.bodyLarge!,
                child: content,
              ),
            ),
          ),
        ),
      ),
    );

    if (builder != null) {
      children.add(
        Column(
          children: <Widget>[builder!(context, t)],
        ),
      );
    }

    return _FlexibleDetail(
      t,
      child: ClipRect(
        child: DefaultTextStyle(
          style: Theme.of(context).primaryTextTheme.bodyLarge!,
          child: Stack(
            fit: StackFit.expand,
            children: children,
          ),
        ),
      ),
    );
  }
}

class _FlexibleDetail extends InheritedWidget {
  ///0 : Expanded
  ///1 : Collapsed
  final double t;

  const _FlexibleDetail(
    this.t, {
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_FlexibleDetail oldWidget) {
    return oldWidget.t != t;
  }
}

/// 用在 [FlexibleDetailBar.background]
/// child上下滑动的时候会覆盖上黑色阴影
class FlexShadowBackground extends StatelessWidget {
  final Widget child;

  const FlexShadowBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = FlexibleDetailBar.percentage(context);
    t = Curves.ease.transform(t) / 2 + 0.2;
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Colors.black.withOpacity(t),
      ),
      child: child,
    );
  }
}
