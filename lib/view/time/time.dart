import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/widgets/time_items/azakr_section.dart';
import 'package:islami/widgets/time_items/azkar_text.dart';
import 'package:islami/widgets/time_items/prayer_times_section.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> selectedIndex = ValueNotifier(0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrayerTimesSection(selectedIndex: selectedIndex),
        SizedBox(height: 20.h),
        const AzkarText(),
        SizedBox(height: 5.h),
        const AzakrSection(),
      ],
    );
  }
}
