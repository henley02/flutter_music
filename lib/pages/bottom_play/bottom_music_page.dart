import 'package:flutter/material.dart';
import 'package:flutter_music/theme/widgets/theme_background.dart';

class BottomMusicPage extends StatelessWidget {
  const BottomMusicPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ThemeBackground(
      child: child,
      //todo add bottom play button
    );
  }
}
