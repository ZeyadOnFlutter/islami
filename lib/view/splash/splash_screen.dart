import 'package:flutter/material.dart';
import 'package:islami/view/slider/slider_screen.dart';
import 'package:islami/widgets/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
    ).then(
      (value) {
        Navigator.pushNamed(context, SliderScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/splash_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: getMediaQueryHeight(0.06115879828326181, context),
            child: Image.asset(
              'assets/images/nonamemosque.png',
            ),
          ),
          Positioned(
            top: 0,
            right: getMediaQueryWidth(0.013948497854077253, context),
            child: Image.asset('assets/images/lamp.png'),
          ),
          Positioned(
            left: 0,
            top: getMediaQueryHeight(0.2296137339055794, context),
            child: Image.asset('assets/images/mosqueshapeleft.png'),
          ),
          Positioned(
            right: 0,
            bottom: getMediaQueryHeight(0.12017167381974248, context),
            child: Image.asset('assets/images/mosqueshaperight.png'),
          ),
          Positioned(
            right: 0,
            bottom: getMediaQueryHeight(0.12017167381974248, context),
            child: Image.asset('assets/images/mosqueshaperight.png'),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: getMediaQueryHeight(0.02, context),
            children: [
              Image.asset('assets/images/islamishape.png'),
              Image.asset('assets/images/islamitext.png'),
            ],
          ),
          Positioned(
            bottom: getMediaQueryHeight(0.034334763948497855, context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: getMediaQueryHeight(0.02, context),
              children: [
                Image.asset('assets/images/routegold.png'),
                Image.asset('assets/images/supervised.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
