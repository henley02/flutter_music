import 'package:flutter/material.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/widgets/border_image.dart';

class Record extends StatelessWidget {
  const Record({
    Key? key,
    required this.animation,
    required this.url,
  }) : super(key: key);

  final Animation<double> animation;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
        child: RotationTransition(
          turns: animation,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                R.images.bet,
                width: 300,
              ),
              BorderImage(
                url: '$url?param=200y200',
                border: 213 / 1,
                boxFit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
