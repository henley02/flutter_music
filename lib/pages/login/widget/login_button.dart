import 'package:flutter/material.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/widgets/gradient_button.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const LoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      borderRadius: 25,
      colors: [Colors.lightBlue.shade300, Colors.blueAccent],
      onTap: onTap,
      child: Text(
        '登录',
        style: Style.puhui20white,
      ),
    );
  }
}
