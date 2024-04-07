import 'package:flutter/material.dart';

Widget discoverBg({
  required List<Widget> slivers,
}) {
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: slivers,
    ),
  );
}

SliverToBoxAdapter buttonsLayout({
  required List<Map<String, dynamic>> items,
  required Widget Function(Map<String, dynamic> item) itemBuilder,
}) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          items.length,
          (index) => itemBuilder(items[index]),
        ),
      ),
    ),
  );
}
