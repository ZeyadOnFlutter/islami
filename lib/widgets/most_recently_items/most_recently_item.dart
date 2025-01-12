import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/view/quran/sura_details_screen.dart';
import 'package:islami/widgets/functions.dart';

class MostRecentlyItem extends StatelessWidget {
  MostRecentlyItem({required this.sura, super.key});
  Sura sura;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: sura,
        );
      },
      child: Container(
        height: getMediaQueryHeight(0.1740139211136891, context),
        width: getMediaQueryWidth(0.75, context),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.englishName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppTheme.black,
                        fontSize: 24,
                        fontFamily: 'jannalt',
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  sura.arabicName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppTheme.black,
                        fontSize: 24,
                        fontFamily: 'jannalt',
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  '${sura.verses} verses',
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
      ),
    );
  }
}
