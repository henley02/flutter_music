import 'package:flutter/cupertino.dart';

SizedBox hBox(double width) => SizedBox(width: width);
SizedBox vBox(double height) => SizedBox(height: height);
SliverToBoxAdapter sliverVBox(double height) => SliverToBoxAdapter(
      child: vBox(height),
    );

SliverToBoxAdapter sliverHBox(double width) => SliverToBoxAdapter(
      child: hBox(width),
    );
