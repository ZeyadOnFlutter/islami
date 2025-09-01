import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/model/radio/radio.dart';
import 'package:islami/provider/radio_provider.dart';
import 'package:islami/widgets/functions.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RadioItem extends StatefulWidget {
  RadioItem({
    required this.radios,
    super.key,
  });
  Radios radios;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isMuted = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<RadioProvider>(builder: (_, radioprovider, __) {
      return SizedBox(
        height: getMediaQueryHeight(0.15, context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(
                15,
              ),
              height: getMediaQueryHeight(0.15, context),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE2BE7F),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Text(
                widget.radios.name ?? '',
                style: const TextStyle(
                  fontFamily: 'jannalt',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            (radioprovider.currentPlayingUrl == widget.radios.url &&
                    radioprovider.isPlaying)
                ? Positioned(
                    bottom: getMediaQueryHeight(-0.04, context),
                    child: Image.asset('assets/images/waves.png'),
                  )
                : Positioned(
                    bottom: 0,
                    child: Image.asset('assets/images/mosque.png'),
                  ),
            Positioned(
              bottom: getMediaQueryHeight(0.02, context),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      radioprovider.play(widget.radios.url ?? '');
                    },
                    child:
                        (radioprovider.currentPlayingUrl == widget.radios.url &&
                                radioprovider.isPlaying)
                            ? SvgPicture.asset(
                                'assets/images/pause.svg',
                              )
                            : SvgPicture.asset(
                                'assets/images/start.svg',
                              ),
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(0.05, context),
                  ),
                  InkWell(
                    onTap: () {
                      radioprovider.stop();
                    },
                    child: const Icon(
                      Icons.stop,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: getMediaQueryWidth(0.05, context),
                  ),
                  InkWell(
                    onTap: () {
                      isMuted = !isMuted;
                      if (radioprovider.currentPlayingUrl ==
                              widget.radios.url &&
                          radioprovider.isPlaying) {
                        radioprovider.setVolume(
                          !isMuted ? 1.0 : 0.0,
                        );
                      }
                      setState(() {});
                    },
                    child: !isMuted
                        ? SvgPicture.asset(
                            'assets/images/sound.svg',
                          )
                        : SvgPicture.asset(
                            'assets/images/mute.svg',
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
