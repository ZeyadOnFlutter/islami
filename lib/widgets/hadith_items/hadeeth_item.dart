import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/hadith.dart';
import 'package:islami/view/hadith/hadith_details_screen.dart';
import 'package:islami/widgets/functions.dart';

// ignore: must_be_immutable
class HadeethItem extends StatefulWidget {
  HadeethItem({
    required this.index,
    super.key,
  });
  int index;

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  HadithData? hadithData;

  @override
  Widget build(BuildContext context) {
    if (hadithData == null) {
      loadHadithFile();
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadithDetailsScreen.routeName,
          arguments: hadithData,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getMediaQueryWidth(0.019976744186046513, context),
                vertical: getMediaQueryHeight(0.012907725321888412, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getMediaQueryWidth(0.21627906976744185, context),
                    height: getMediaQueryHeight(0.10797210300429185, context),
                    child: Image.asset(
                      'assets/headers/black_header_left.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      hadithData?.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20.sp,
                            fontFamily: 'jannalt',
                            fontWeight: FontWeight.w700,
                            color: AppTheme.black,
                          ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(0.21627906976744185, context),
                    height: getMediaQueryHeight(0.10797210300429185, context),
                    child: Image.asset(
                      'assets/headers/black_header_right.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hadithbackground.png'),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getMediaQueryWidth(0.07346511627906977, context),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    hadithData?.content ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: 'jannalt',
                          fontWeight: FontWeight.w700,
                          color: AppTheme.black,
                        ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
            Image.asset('assets/footer/black_footer.png'),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadithFile() async {
    String hadith =
        await rootBundle.loadString('assets/hadeeth/h${widget.index + 1}.txt');
    List<String> hadithList = hadith.split('\n');
    String title = hadithList[0];
    hadithList.removeAt(0);
    List<String> contentList = hadithList;
    String content = contentList.join('');
    hadithData = HadithData(
      title: title,
      content: content,
      num: widget.index + 1,
    );
    setState(() {});
  }
}
