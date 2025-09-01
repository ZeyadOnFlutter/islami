import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/api/api_service.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/prayer_time_response.dart';
import 'package:islami/widgets/time_items/prayer_times_header.dart';
import 'package:islami/widgets/time_items/prayer_times_slider.dart';

class PrayerTimesSection extends StatelessWidget {
  const PrayerTimesSection({super.key, required this.selectedIndex});
  final ValueNotifier<int?> selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FutureBuilder<PrayerTimeResponse>(
          future: ApiService().getPrayerTimes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primary,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Error: ${snapshot.error}'),
                  const Text('Something went wrong'),
                  ElevatedButton(
                    onPressed: () {
                      ApiService().getPrayerTimes();
                    },
                    child: const Text('Retry'),
                  )
                ],
              );
            } else {
              final prayerTimes = snapshot.data;
              final mytiming = prayerTimes?.data!.timings!.toJson();
              return Container(
                height: 301.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppTheme.secondary,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/prayer_times.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 5.h,
                      left: 25.h,
                      right: 25.h,
                      child: PrayerTimesHeader(prayerTimes: prayerTimes),
                    ),
                    PrayerTimesSlider(selectedIndex: selectedIndex, mytiming: mytiming),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
