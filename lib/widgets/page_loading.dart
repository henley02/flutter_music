import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.indigo,
    ];
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: const SizedBox(
        width: 50,
        height: 25,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: colors,
          backgroundColor: Colors.white,
          strokeWidth: 0.5,
        ),
      ),
    );
  }
}
