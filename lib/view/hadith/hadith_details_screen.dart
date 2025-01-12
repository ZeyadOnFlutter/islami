import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/hadith.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/widgets/functions.dart';

class HadithDetailsScreen extends StatefulWidget {
  HadithDetailsScreen({super.key});

  static const routeName = '/hadith';

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  late HadithData hadithData;
  @override
  Widget build(BuildContext context) {
    hadithData = ModalRoute.of(context)?.settings.arguments as HadithData;
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        surfaceTintColor: AppTheme.black,
        title: Text(
          'Hadith ${hadithData.num}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: AppTheme.primary,
                fontFamily: 'jannalt',
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppTheme.primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getMediaQueryWidth(0.04186046511627907, context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getMediaQueryHeight(0.02, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/headers/gold_header_left.png',
                  ),
                  Text(
                    hadithData.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          color: AppTheme.primary,
                          fontFamily: 'jannalt',
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Image.asset(
                    'assets/headers/gold_header_right.png',
                  ),
                ],
              ),
            ),
            hadithData == null
                ? const CircularProgressIndicator(
                    color: AppTheme.primary,
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadithData.content,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                              color: AppTheme.primary,
                              fontFamily: 'jannalt',
                              fontWeight: FontWeight.w700,
                              height: 2.2,
                            ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
            Image.asset('assets/footer/gold_footer.png'),
          ],
        ),
      ),
    );
  }
}
