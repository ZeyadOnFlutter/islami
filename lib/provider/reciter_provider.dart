import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ReciterProvider with ChangeNotifier {
  String? currentPlayingUrl;
  double currentVolume = 1.0;
  bool isPlaying = false;
  AudioPlayer player = AudioPlayer();
  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayingUrl = url;
      player.play(UrlSource(url));
      isPlaying = true;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    isPlaying = false;
    currentPlayingUrl = null;
    await player.stop();
    notifyListeners();
  }

  Future<void> setVolume(volume) async {
    currentVolume = volume;
    await player.setVolume(volume);
    notifyListeners();
  }
}
