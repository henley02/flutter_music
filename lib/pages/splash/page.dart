import 'package:flutter/material.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween(begin: 0.0, end: 1.0);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..drive(_tween);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInQuart,
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.offAndToNamed(Routes.login);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              _buildTitle(),
              _buildDesc(),
            ],
          ),
        ),
      ),
    );
  }

  _buildLogo() {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(R.images.logo),
    );
  }

  _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Text(
        '云音乐app',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: R.fonts.PuHuiTi,
        ),
      ),
    );
  }

  _buildDesc() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        '您的flutter音乐管家app',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: R.fonts.GuFengLiShu,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
