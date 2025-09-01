import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';

class AzkarDetailsText extends StatelessWidget {
  const AzkarDetailsText({super.key, this.text1, this.text2});
  final String? text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1 ?? "",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20,
                  color: AppTheme.white,
                  fontFamily: 'jannalt',
                  fontWeight: FontWeight.w700,
                  height: 2.2,
                ),
          ),
          TextSpan(
            text: text2 ?? "",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20,
                  color: AppTheme.primary,
                  fontFamily: 'jannalt',
                  fontWeight: FontWeight.w700,
                  height: 2.2,
                ),
          ),
        ],
      ),
    );
  }
}
