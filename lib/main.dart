import 'package:flutter/material.dart';
import 'package:islami/view/homescreen.dart';
import 'package:islami/view/islami_radio.dart';
import 'package:islami/view/sebha.dart';
import 'package:islami/view/slider_screen.dart';
import 'package:islami/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        Homescreen.routeName: (_) => Homescreen(),
        Sebha.routeName: (_) => Sebha(),
        IslamiRadio.routeName: (_) => IslamiRadio(),
        SliderScreen.routeName: (_) => SliderScreen(),
      },
      initialRoute: Homescreen.routeName,
    );
  }
}
