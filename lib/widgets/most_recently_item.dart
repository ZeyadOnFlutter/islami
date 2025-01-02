import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/widgets/functions.dart';

class MostRecentlyItem extends StatelessWidget {
  const MostRecentlyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getMediaQueryHeight(0.1740139211136891, context),
      width: getMediaQueryWidth(0.7, context),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Al-Anbiya',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.black,
                      fontSize: 24,
                      fontFamily: 'jannalt',
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                'الأنبياء',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.black,
                      fontSize: 24,
                      fontFamily: 'jannalt',
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                '112 Verses ',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.black,
                      fontSize: 16,
                      fontFamily: 'jannalt',
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          SizedBox(
            width: getMediaQueryWidth(0.35116279069767444, context),
            height: getMediaQueryHeight(0.15777262180974477, context),
            child: Image.asset(
              'assets/images/mostrecentlybackground.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
