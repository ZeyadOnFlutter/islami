import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/widgets/functions.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});
  static const routeName = '/sura';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;
  List<String> suradetials = [];
  String theSura = '';
  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)?.settings.arguments as Sura;
    if (suradetials.isEmpty) {
      loadSuraFile();
    }
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        title: Text(
          sura.englishName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: AppTheme.primary,
                fontFamily: 'jannalt',
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppTheme.primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getMediaQueryWidth(0.04186046511627907, context),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getMediaQueryHeight(0.02, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/headers/gold_header_left.png',
                ),
                Text(
                  sura.arabicName,
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
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  theSura,
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
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    String mysura = await rootBundle.loadString('assets/suras/${sura.num}.txt');
    suradetials = mysura.split('\n');
    theSura = suradetials.join('[]');

    setState(() {});
  }
}
