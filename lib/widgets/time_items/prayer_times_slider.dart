import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:islami/widgets/time_items/prayer_times_item.dart';

class PrayerTimesSlider extends StatelessWidget {
  const PrayerTimesSlider({super.key, this.mytiming, required this.selectedIndex});
  final Map<String, dynamic>? mytiming;
  final ValueNotifier<int?> selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: ValueListenableBuilder<int?>(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return CarouselSlider.builder(
            itemCount: mytiming!.length,
            itemBuilder: (context, index, realIndex) {
              final keys = mytiming!.keys.toList();
              final values = mytiming!.values.toList();
              DateTime parsedTime = DateFormat("HH:mm").parse(values[index]);
              String period = DateFormat("a").format(parsedTime);

              return PrayerTimesItem(
                keys: keys,
                values: values,
                index: index,
                selectedIndex: selectedIndex,
                parsedTime: parsedTime,
                period: period,
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.3.r,
              initialPage: 0,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
              //  enlargeFactor: 0.4,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                selectedIndex.value = index;
              },
            ),
          );
        },
      ),
    );
  }
}
