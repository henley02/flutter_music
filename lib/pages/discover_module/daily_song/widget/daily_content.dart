import 'package:flutter/material.dart';

class DailyContent extends StatelessWidget {
  final String dd;
  final String mm;
  const DailyContent({
    Key? key,
    required this.dd,
    required this.mm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: dd,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          TextSpan(
            text: mm,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ]),
      ),
    );
  }
}
