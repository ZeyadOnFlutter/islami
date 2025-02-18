import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/sura_service.dart';
import 'package:islami/provider/radio_provider.dart';
import 'package:islami/provider/reciter_provider.dart';
import 'package:islami/view/hadith/hadith_details_screen.dart';
import 'package:islami/view/home/homescreen.dart';
import 'package:islami/view/slider/slider_screen.dart';
import 'package:islami/view/splash/splash_screen.dart';
import 'package:islami/view/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraService.getMostRecentlyList();
  runApp(
    ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RadioProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ReciterProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
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
        HadithDetailsScreen.routeName: (_) => HadithDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
