import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/hadith_items/hadeeth_item.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getMediaQueryHeight(0.021459227467811157, context),
        top: getMediaQueryHeight(0.02950643776824035, context),
      ),
      child: CarouselSlider.builder(
        itemCount: 50,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getMediaQueryWidth(0.01, context),
            ),
            child: HadeethItem(
              index: index,
            ),
          );
        },
        options: CarouselOptions(
          viewportFraction: 0.7,
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: 0.22,
        ),
      ),
    );
  }
}
