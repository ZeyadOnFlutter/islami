import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/view/sura_details_screen.dart';
import 'package:islami/widgets/functions.dart';

class SuraItem extends StatelessWidget {
  SuraItem({required this.sura, super.key});
  Sura sura;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            SuraDetailsScreen.routeName,
            arguments: sura,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getMediaQueryHeight(0.060324825986078885, context),
              height: getMediaQueryHeight(0.060324825986078885, context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/suranum.png'),
                ),
              ),
              child: Center(
                child: Text(
                  sura.num.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'jannalt',
                        color: AppTheme.white,
                        fontSize: 20,
                      ),
                ),
              ),
            ),
            SizedBox(
              width: getMediaQueryWidth(0.055813953488372094, context),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.englishName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'jannalt',
                        color: AppTheme.white,
                        fontSize: 20,
                      ),
                ),
                SizedBox(
                  height: getMediaQueryHeight(0.007, context),
                ),
                Text(
                  '${sura.verses.toString()} verses',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'jannalt',
                        color: AppTheme.white,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              sura.arabicName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: 'jannalt',
                    color: AppTheme.white,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
