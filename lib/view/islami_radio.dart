import 'package:flutter/material.dart';
import 'package:islami/view/radio_name.dart';
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
    return Stack(
        children: [
          // Background Image
          Positioned(
            child: Image.asset(
              'assets/quran.jpeg',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(32, 32, 32, 0.7),
                    Color.fromRGBO(32, 32, 32, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: getMediaQueryHeight(0.04, context),
            child: Container(
              height: getMediaQueryHeight(0.9, context),
              padding: EdgeInsets.symmetric(
                  horizontal: getMediaQueryWidth(0.05, context)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/islamilogo.png',
                  ),
                  SizedBox(
                    height: getMediaQueryHeight(0.02, context),
                  ),
                  getRadioType(onTap1, onTap2, isPressed1, isPressed2, context),
                  SizedBox(
                    height: getMediaQueryHeight(0.01, context),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: radioNames.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: getMediaQueryHeight(0.02, context),
                          ),
                          child: getRadio(
                            isPressed1 == true
                                ? radioNames[index]
                                : reciters[index],
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
            ),
          ),
        ],
      );

  }
}
