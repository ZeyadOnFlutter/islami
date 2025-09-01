import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/view/time/azkar_data.dart';
import 'package:islami/view/time/azkar_details_screen.dart';

class AzkarSectionItem extends StatelessWidget {
  const AzkarSectionItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AzkarDetailsScreen.routeName,
          arguments: azkarData[index],
        );
      },
      child: Container(
        height: 259.h,
        decoration: ShapeDecoration(
          color: AppTheme.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: const BorderSide(
              color: AppTheme.primary,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            children: [
              Image(
                image: AssetImage(azkarData[index]["image"]!),
              ),
              const Spacer(),
              Text(
                azkarData[index]["titleEn"]!,
                style: TextStyle(
                  color: AppTheme.white,
                  fontFamily: "jannalt",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
