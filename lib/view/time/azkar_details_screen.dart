import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/azkar_model.dart';
import 'package:islami/view/time/azkar_data.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/time_items/azkar_details_header.dart';
import 'package:islami/widgets/time_items/azkar_details_text.dart';

class AzkarDetailsScreen extends StatefulWidget {
  const AzkarDetailsScreen({super.key});

  static const routeName = '/azkarDetails';

  @override
  State<AzkarDetailsScreen> createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  late Map<String, String> azkarItem;
  @override
  Widget build(BuildContext context) {
    azkarItem = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        surfaceTintColor: AppTheme.black,
        title: Text(
          azkarItem["titleEn"]!,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: AppTheme.primary,
                fontFamily: 'jannalt',
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppTheme.primary,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getMediaQueryWidth(0.04186046511627907, context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AzkarDetailsHeader(headerText: azkarItem["titleAr"]),
              Expanded(
                child: FutureBuilder<List<AzkarModel>>(
                  future: AzkarModel.loadAzkar(azkarItem["titleAr"]!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primary,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(
                              color: AppTheme.primary,
                              fontFamily: "jannalt",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'Something went wrong',
                          ),
                          ElevatedButton(
                            onPressed: () {
                              AzkarModel.loadAzkar(azkarItem["titleAr"]!);
                              setState(() {});
                            },
                            child: const Text('Retry'),
                          )
                        ],
                      );
                    }
                    List<AzkarModel> azkarList = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height: 20.h),
                        scrollDirection: Axis.vertical,
                        itemCount: azkarList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: AppTheme.primary,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AzkarDetailsText(
                                  text1: "تاذكر : ",
                                  text2: azkarList[index].content,
                                ),
                                AzkarDetailsText(
                                  text1: "العدد : ",
                                  text2: azkarList[index].count,
                                ),
                                AzkarDetailsText(
                                  text1: "الوصف : ",
                                  text2: azkarList[index].description.isEmpty
                                      ? "لا يوجد وصف"
                                      : azkarList[index].description,
                                ),
                                AzkarDetailsText(
                                  text1: "المرجع : ",
                                  text2: azkarList[index].reference.isEmpty
                                      ? "لا يوجد مرجع"
                                      : azkarList[index].reference,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Image.asset('assets/footer/gold_footer.png'),
            ],
          ),
        ),
      ),
    );
  }
}
