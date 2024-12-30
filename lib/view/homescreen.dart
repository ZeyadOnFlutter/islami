import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/view/hadith.dart';
import 'package:islami/view/islami_radio.dart';
import 'package:islami/view/quran.dart';
import 'package:islami/view/sebha.dart';
import 'package:islami/view/time.dart';
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
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: SvgPicture.asset('assets/quran.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/quran.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/hadith.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/hadith.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'hadith',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/necklace.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/necklace.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/radio.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/radio.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/time.svg'),
            activeIcon: getIconContainer(
              child: SvgPicture.asset(
                'assets/time.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            label: 'Time',
          ),
        ],
      ),
      body: mywidgets[currentindex],
    );
  }
}
