import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/model/radio/radio.dart';
import 'package:islami/model/recitres/reciter.dart';
import 'package:islami/provider/radio_provider.dart';
import 'package:islami/provider/reciter_provider.dart';
import 'package:islami/widgets/functions.dart';
import 'package:islami/widgets/radio_item/radio_name.dart';
import 'package:provider/provider.dart';

class ReciterItem extends StatefulWidget {
  ReciterItem({
    required this.reciter,
    super.key,
  });
  Reciter reciter;

  @override
  State<ReciterItem> createState() => _ReciterItemState();
}

class _ReciterItemState extends State<ReciterItem> {
  bool isMuted = false;
  String? url;
  @override
  void initState() {
    super.initState();
    getUrl();
  }

  getUrl() {
    url = "${widget.reciter.moshaf![0].server}002.mp3";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReciterProvider>(builder: (_, reciterProvider, __) {
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
                widget.reciter.name ?? '',
                style: const TextStyle(
                  fontFamily: 'jannalt',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            (reciterProvider.currentPlayingUrl == url &&
                    reciterProvider.isPlaying)
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
                      reciterProvider.play(url ?? '');
                    },
                    child: (reciterProvider.currentPlayingUrl == url &&
                            reciterProvider.isPlaying)
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
                      reciterProvider.stop();
                    },
                    child: Icon(
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
                      if (reciterProvider.currentPlayingUrl == url &&
                          reciterProvider.isPlaying) {
                        reciterProvider.setVolume(
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
