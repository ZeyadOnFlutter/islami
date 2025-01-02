import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/view/homescreen.dart';
import 'package:islami/view/slider_screen.dart';
import 'package:islami/view/splash_screen.dart';
import 'package:islami/view/sura_details_screen.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        SliderScreen.routeName: (_) => const SliderScreen(),
        Homescreen.routeName: (_) => const Homescreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
      },
      initialRoute: Homescreen.routeName,
    );
  }
}
