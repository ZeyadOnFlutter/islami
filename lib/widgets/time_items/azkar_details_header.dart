import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/widgets/functions.dart';

class AzkarDetailsHeader extends StatelessWidget {
  const AzkarDetailsHeader({super.key, this.headerText});
  final String? headerText;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(
          top: getMediaQueryHeight(0.02, context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/gold_header_left.png',
            ),
            Text(
              headerText ?? "",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: AppTheme.primary,
                    fontFamily: 'jannalt',
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Image.asset(
              'assets/images/gold_header_right.png',
            ),
          ],
        ),
      ),
    );
  }
}
