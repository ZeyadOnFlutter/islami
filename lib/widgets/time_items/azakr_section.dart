import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/view/time/azkar_data.dart';
import 'package:islami/widgets/time_items/azkar_section_item.dart';

class AzakrSection extends StatelessWidget {
  const AzakrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 185.w / 259.h,
          ),
          itemCount: azkarData.length,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return AzkarSectionItem(index: index);
          },
        ),
      ),
    );
  }
}
