import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/widgets/functions.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});
  static const routeName = '/sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله اكبر', 'لاإله إلا الله'];
  int azkarindex = 0;
  double rotationangle = 0;

  void onPressedSebha() {
    if (counter >= 32) {
      counter = 0;
      if (azkarindex >= azkar.length - 1) {
        azkarindex = 0;
      } else {
        azkarindex++;
      }
    } else {
      counter++;
      rotationangle += 10 / 360;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getMediaQueryHeight(0.018561484918793503, context),
        ),
        const Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: TextStyle(
            fontFamily: 'jannalt',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
        SizedBox(
          height: getMediaQueryHeight(0.1, context),
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: getMediaQueryHeight(-0.09, context),
              child: Padding(
                padding: EdgeInsets.only(left: getMediaQueryWidth(0.1, context)),
                child: Image.asset('assets/images/sebhahead.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getMediaQueryWidth(0.03, context)),
              child: InkWell(
                onTap: onPressedSebha,
                child: AnimatedRotation(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 100),
                  turns: rotationangle,
                  child: Image.asset(
                    'assets/images/sebhabody.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  azkar[azkarindex],
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: 'jannalt',
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
                SizedBox(
                  height: getMediaQueryHeight(0.018561484918793503, context),
                ),
                Text(
                  counter.toString(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: 'jannalt',
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
