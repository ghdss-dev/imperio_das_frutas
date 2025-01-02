import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {

  50: const Color.fromARGB(255, 247, 70,1, ),
  100: const Color.fromARGB(255, 230, 222, 218),
  200: const Color.fromARGB(255, 247, 70, 3),
  300: const Color.fromARGB(255, 247, 70, 4),
  400: const Color.fromARGB(255, 247, 70, 5),
  500: const Color.fromARGB(255, 247, 70, 6),
  600: const Color.fromARGB(255, 247, 70, 7),
  700: const Color.fromARGB(255, 247, 70, 8),
  800: const Color.fromARGB(255, 247, 70, 9),
  090: const Color(0xFFF74601),
};

abstract class CustomColors {

  static Color customConstrastColor = Colors.red.shade700;

  static MaterialColor customSwatchColor = MaterialColor(0xFF8BC34A,_swatchOpacity);
}