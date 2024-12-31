import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/view/slidername.dart';
import 'package:islami/widgets/functions.dart';

Widget getRadioType(
  void Function() onTap1,
  void Function() onTap2,
  bool isPressed1,
  bool isPressed2,
  BuildContext context,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color.fromRGBO(32, 32, 32, 0.7),
    ),
    child: Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: getMediaQueryHeight(0.01, context),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isPressed1 == true
                    ? const Color(0xFFE2BE7F)
                    : const Color.fromRGBO(32, 32, 32, 0.7),
              ),
              child: Text(
                'Radio',
                style: TextStyle(
                  fontFamily: 'jannalt',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isPressed1 ? Colors.black : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: onTap2,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: getMediaQueryHeight(0.01, context),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isPressed2 == false
                    ? const Color.fromRGBO(32, 32, 32, 0.7)
                    : const Color(0xFFE2BE7F),
              ),
              child: Text(
                'Reciters',
                style: TextStyle(
                  fontFamily: 'jannalt',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isPressed2 == false ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getRadio(
  String text,
  void Function() onTap1,
  void Function() onTap2,
  bool isPressed1,
  bool isPressed2,
  BuildContext context,
) {
  return SizedBox(
    height: getMediaQueryHeight(0.15, context),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(
            15,
          ),
          height: getMediaQueryHeight(0.15, context),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFE2BE7F),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'jannalt',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        isPressed1 == false
            ? Positioned(
                bottom: 0,
                child: Image.asset('assets/mosque.png'),
              )
            : Positioned(
                bottom: getMediaQueryHeight(-0.04, context),
                child: Image.asset('assets/waves.png'),
              ),
        Positioned(
          bottom: getMediaQueryHeight(0.02, context),
          child: Padding(
            padding: EdgeInsets.only(
              left: getMediaQueryWidth(0.14, context),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: onTap1,
                  child: isPressed1 == false
                      ? SvgPicture.asset(
                          'assets/start.svg',
                        )
                      : SvgPicture.asset(
                          'assets/pause.svg',
                        ),
                ),
                SizedBox(
                  width: getMediaQueryWidth(0.05, context),
                ),
                InkWell(
                  onTap: onTap2,
                  child: isPressed2 == false
                      ? SvgPicture.asset(
                          'assets/sound.svg',
                        )
                      : SvgPicture.asset(
                          'assets/mute.svg',
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

Widget getSliderItem(String path, BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getMediaQueryWidth(0.02, context),
    ),
    child: Column(
      children: [
        Image.asset('assets/$path.png'),
        SizedBox(
          height: getMediaQueryHeight(0.03, context),
        ),
        Text(
          sliderHeaders[index],
          style: TextStyle(
            fontFamily: 'jannalt',
            color: Color(0xFFE2BE7F),
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: getMediaQueryHeight(0.05, context),
        ),
        Text(
          sliderInfo[index],
          style: TextStyle(
            fontFamily: 'jannalt',
            color: Color(0xFFE2BE7F),
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget getIconContainer({required Widget child}) {
  return Container(
    height: 34,
    width: 59,
    decoration: const BoxDecoration(
      color: Color.fromRGBO(32, 32, 32, 0.6),
      borderRadius: BorderRadius.all(
        Radius.circular(66),
      ),
    ),
    child: FractionallySizedBox(
      heightFactor: 0.7,
      widthFactor: 0.7,
      child: child,
    ),
  );
}
