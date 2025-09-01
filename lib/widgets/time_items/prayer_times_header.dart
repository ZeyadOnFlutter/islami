import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/prayer_time_response.dart';

class PrayerTimesHeader extends StatelessWidget {
  const PrayerTimesHeader({super.key, this.prayerTimes});
  final PrayerTimeResponse? prayerTimes;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          "${prayerTimes?.data!.date!.gregorian!.day ?? ""} ${prayerTimes?.data!.date!.gregorian!.month?.en.substring(0, 3) ?? ""},\n${prayerTimes?.data!.date!.gregorian!.year ?? ""}",
          maxLines: 2,
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "jannalt",
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Column(
          children: [
            AutoSizeText(
              "Pray Time",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromRGBO(32, 32, 32, 0.71),
                fontFamily: "jannalt",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            AutoSizeText(
              prayerTimes?.data!.date!.gregorian!.weekday?.en ?? "",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromRGBO(32, 32, 32, 0.9),
                fontFamily: "jannalt",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        AutoSizeText(
          "${prayerTimes?.data!.date!.hijri!.day ?? ""} ${prayerTimes?.data!.date!.hijri!.month?.en.substring(0, 3) ?? ""},\n${prayerTimes?.data!.date!.hijri!.year ?? ""}",
          maxLines: 2,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: AppTheme.white,
            fontFamily: "jannalt",
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
