import 'package:flutter/material.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/quranbackground.png',
          ),
        ],
      ),
    );
  }
}
