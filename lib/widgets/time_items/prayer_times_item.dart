import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:islami/model/app_theme.dart';

class PrayerTimesItem extends StatelessWidget {
  const PrayerTimesItem({
    super.key,
    required this.keys,
    required this.values,
    required this.index,
    required this.selectedIndex,
    required this.parsedTime,
    required this.period,
  });
  final List<String> keys;
  final List<dynamic> values;
  final int index;
  final ValueNotifier<int?> selectedIndex;
  final DateTime parsedTime;
  final String period;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: selectedIndex.value == index ? 104.w : 86.w,
          height: selectedIndex.value == index ? 128.h : 106.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF202020),
                Color(0xFFB19768),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                style: TextStyle(
                  color: AppTheme.white,
                  fontFamily: "jannalt",
                  fontSize: selectedIndex.value == index ? 16.sp : 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                child: AutoSizeText(
                  keys[index],
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                style: TextStyle(
                  color: AppTheme.white,
                  fontFamily: "jannalt",
                  fontSize: selectedIndex.value == index ? 30.sp : 22.sp,
                  fontWeight: FontWeight.w700,
                ),
                child: AutoSizeText(
                  DateFormat("hh:mm").format(parsedTime),
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                style: TextStyle(
                  color: AppTheme.white,
                  fontFamily: "jannalt",
                  fontSize: selectedIndex.value == index ? 16.sp : 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                child: AutoSizeText(period),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
