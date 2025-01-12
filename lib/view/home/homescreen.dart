import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/view/hadith/hadith.dart';
import 'package:islami/view/radio/islami_radio.dart';
import 'package:islami/view/quran/quran.dart';
import 'package:islami/view/sebha/sebha.dart';
import 'package:islami/view/time/time.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  static const routeName = '/home';
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> mywidgets = [
    Quran(),
    Hadith(),
    Sebha(),
    IslamiRadio(),
    Time(),
  ];
  List<String> backgroundImages = [
    'quranbackground',
    'hadethbackground',
    'sebhabackground',
    'radiobackground',
    'timebackground',
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Color(0xFFE2BE7F),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'jannalt',
          fontWeight: FontWeight.w700,
        ),
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/quran.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/images/quran.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/hadith.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/images/hadith.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'hadith',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/necklace.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/images/necklace.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/radio.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/images/radio.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/time.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/images/time.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Time',
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/${backgroundImages[currentindex]}.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getMediaQueryHeight(0.03480278422273782, context),
            ),
            Image.asset(
              'assets/images/islamilogo.png',
            ),
            Expanded(child: mywidgets[currentindex]),
          ],
        ),
      ),
    );
  }
}
