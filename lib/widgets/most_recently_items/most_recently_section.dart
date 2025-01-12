import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/sura_service.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/most_recently_items/most_recently_item.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getMediaQueryHeight(0.21, context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppTheme.white,
                ),
          ),
          SizedBox(
            height: getMediaQueryHeight(0.01160092807424594, context),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return MostRecentlyItem(
                  sura: SuraService.mostRecentlySura.reversed.toList()[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: getMediaQueryWidth(0.023255813953488373, context),
                );
              },
              itemCount: SuraService.mostRecentlySura.length,
            ),
          ),
          SizedBox(
            height: getMediaQueryHeight(0.01160092807424594, context),
          ),
        ],
      ),
    );
  }
}
