import 'package:flutter/material.dart';
import 'package:islami/widgets/functions.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});
  static const routeName = '/sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لاإله إلا الله'
  ];
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
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/sebha.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(32, 32, 32, 0.7),
                    Color.fromRGBO(32, 32, 32, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 0,
            right: 0,
            top: getMediaQueryHeight(0.04, context),
            child: Column(
              children: [
                Image.asset(
                  'assets/islamilogo.png',
                ),
                SizedBox(
                  height: getMediaQueryHeight(0.02, context),
                ),
                Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  style: TextStyle(
                    fontFamily: 'jannalt',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                SizedBox(
                  height: getMediaQueryHeight(0.02, context),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: getMediaQueryHeight(0.05, context),
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: getMediaQueryWidth(-0.18, context),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: getMediaQueryWidth(0.15, context)),
                    child: Image.asset(
                      'assets/sebhahead.png',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: onPressedSebha,
                    child: AnimatedRotation(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 100),
                      turns: rotationangle,
                      child: Image.asset(
                        'assets/sebhabody.png',
                        height: getMediaQueryHeight(0.4, context),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      azkar[azkarindex],
                      style: TextStyle(
                        fontFamily: 'jannalt',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: getMediaQueryHeight(0.03, context),
                    ),
                    Text(
                      counter.toString(),
                      style: TextStyle(
                        fontFamily: 'jannalt',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
