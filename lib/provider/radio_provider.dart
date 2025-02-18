import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioProvider with ChangeNotifier {
  String? currentPlayingUrl;
  AudioPlayer player = AudioPlayer();
  double currentVolume = 1.0;
  bool isPlaying = false;
  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : player.resume();
      isPlaying = !isPlaying;
    } else {
      player.stop();
      currentPlayingUrl = url;
      player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await player.stop();
    currentPlayingUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(currentVolume);
    notifyListeners();
  }
}
