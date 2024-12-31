import 'package:flutter/material.dart';
import 'package:islami/widgets/radio_name.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/widgets.dart';

class IslamiRadio extends StatefulWidget {
  const IslamiRadio({super.key});
  static const routeName = '/IslamiRadio';

  @override
  State<IslamiRadio> createState() => _IslamiRadioState();
}

class _IslamiRadioState extends State<IslamiRadio> {
  bool isPressed1 = true;
  bool isPressed2 = false;
  final List<bool> start = List.filled(radioNames.length, false);
  final List<bool> mute = List.filled(radioNames.length, false);

  void onTap1() {
    setState(() {
      isPressed1 = true;
      isPressed2 = false;
    });
  }

  void onTap2() {
    setState(() {
      isPressed1 = false;
      isPressed2 = true;
    });
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
          getRadioType(onTap1, onTap2, isPressed1, isPressed2, context),
          SizedBox(
            height: getMediaQueryHeight(0.01, context),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: getMediaQueryHeight(0.02, context),
                );
              },
              itemCount: radioNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == radioNames.length - 1
                      ? EdgeInsets.only(
                          bottom: getMediaQueryHeight(0.02, context),
                        )
                      : EdgeInsets.zero,
                  child: getRadio(
                    isPressed1 == true ? radioNames[index] : reciters[index],
                    () {
                      setState(() {
                        start[index] = !start[index];
                      });
                    },
                    () {
                      setState(() {
                        mute[index] = !mute[index];
                      });
                    },
                    start[index],
                    mute[index],
                    context,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
