import 'package:flutter/material.dart';

double getMediaQueryHeight(double number, BuildContext context) {
  return MediaQuery.of(context).size.height * number;
}

double getMediaQueryWidth(double number, BuildContext context) {
  return MediaQuery.of(context).size.width * number;
}
