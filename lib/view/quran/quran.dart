import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/sura.dart';
import 'package:islami/model/sura_service.dart';
import 'package:islami/view/quran/sura_details_screen.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/most_recently_items/most_recently_section.dart';
import 'package:islami/widgets/sebha_item/sura_item.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  void initState() {
    super.initState();
    loadMostRecentlyList();
  }

  Future<void> loadMostRecentlyList() async {
    await SuraService.getMostRecentlyList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: getMediaQueryWidth(0.04883720930232558, context),
        right: getMediaQueryWidth(0.05348837209302325, context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppTheme.primary,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppTheme.white,
                ),
            onChanged: (query) {
              SuraService.onSearchSura(query);
              setState(() {});
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppTheme.white,
                  ),
              prefixIcon: SvgPicture.asset(
                'assets/images/searchicon.svg',
                fit: BoxFit.scaleDown,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppTheme.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppTheme.primary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppTheme.primary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: SuraService.mostRecentlySura.isNotEmpty,
                    child: MostRecentlySection(),
                  ),
                  Text(
                    'Suras List',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppTheme.white,
                        ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: SuraService.searchlist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          Sura sura = SuraService.searchlist[index];
                          SuraService.addMostRecentlySura(sura);
                          await Navigator.pushNamed(
                            context,
                            SuraDetailsScreen.routeName,
                            arguments: sura,
                          );
                          setState(() {});
                        },
                        child: SuraItem(
                          sura: SuraService.searchlist[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      indent: getMediaQueryWidth(0.11, context),
                      endIndent: getMediaQueryWidth(0.11, context),
                      color: AppTheme.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
