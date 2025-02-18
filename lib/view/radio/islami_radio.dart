import 'package:flutter/material.dart';
import 'package:islami/api/api_service.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/model/radio/radio.dart';
import 'package:islami/model/radio/radio_response.dart';
import 'package:islami/model/recitres/reciter.dart';
import 'package:islami/model/recitres/recitres.dart';
import 'package:islami/widgets/radio_item.dart';
import 'package:islami/widgets/radio_item/radio_name.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/reciter_item.dart';
import 'package:islami/widgets/widgets.dart';

class IslamiRadio extends StatefulWidget {
  const IslamiRadio({super.key});
  static const routeName = '/IslamiRadio';

  @override
  State<IslamiRadio> createState() => _IslamiRadioState();
}

class _IslamiRadioState extends State<IslamiRadio> {
  int selectedIndex = -1;
  late Future<RadioResponse?> radioResponse;
  late Future<ReciterResponse?> reciterResponse;
  @override
  void initState() {
    super.initState();
    radioResponse = ApiService().getRadios();
    reciterResponse = ApiService().getReciters();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getMediaQueryWidth(0.04651162790697675, context),
      ),
      child: Column(
        children: [
          SizedBox(
            height: getMediaQueryHeight(0.02, context),
          ),
          getRadioType(() {
            setState(() {
              selectedIndex = -1;
            });
          }, () {
            setState(() {
              selectedIndex = 0;
            });
          }, selectedIndex, context),
          SizedBox(
            height: getMediaQueryHeight(0.01, context),
          ),
          selectedIndex == -1
              ? Expanded(
                  child: FutureBuilder<RadioResponse?>(
                    future: radioResponse,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primary,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: AppTheme.primary,
                          ),
                        );
                      }
                      List<Radios> radios = snapshot.data?.radios ?? [];

                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getMediaQueryHeight(0.02, context),
                          );
                        },
                        itemCount: radios.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index == radioNames.length - 1
                                ? EdgeInsets.only(
                                    bottom: getMediaQueryHeight(0.02, context),
                                  )
                                : EdgeInsets.zero,
                            child: RadioItem(
                              radios: radios[index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              : Expanded(
                  child: FutureBuilder<ReciterResponse?>(
                    future: reciterResponse,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primary,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            color: AppTheme.primary,
                          ),
                        );
                      }
                      List<Reciter> reciters = snapshot.data?.reciters ?? [];

                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getMediaQueryHeight(0.02, context),
                          );
                        },
                        itemCount: reciters.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index == radioNames.length - 1
                                ? EdgeInsets.only(
                                    bottom: getMediaQueryHeight(0.02, context),
                                  )
                                : EdgeInsets.zero,
                            child: ReciterItem(
                              reciter: reciters[index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
