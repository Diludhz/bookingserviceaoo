import 'package:flutter/material.dart';

class Styles {
  static const BoxDecoration gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
    colors: [Color(0xff00416a), Color(0xffe4e5e6)],
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ));
}
