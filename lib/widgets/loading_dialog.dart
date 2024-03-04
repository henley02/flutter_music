import 'package:flutter/material.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/res/style.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  final String? text;
  const LoadingDialog({
    Key? key,
    this.text = '加载中...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Lottie.asset(
                      R.lottie.loading,
                      width: 60,
                      animate: true,
                    ),
                  ),
                ),
                Text(
                  text ?? '',
                  style: Style.puhui15white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
