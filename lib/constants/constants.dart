import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const lime = Color.fromARGB(255, 209, 235, 89);
  static const black = Color.fromARGB(255, 9, 15, 21);
  static const darkGreen = Color.fromARGB(255, 31, 36, 23);
  static const grey = Color.fromARGB(255, 68, 76, 80);
  static const darkGrey = Color.fromARGB(255, 34, 43, 47);
  static List<Color> gradientBack = [
    Color.fromARGB(255, 231, 231, 231).withOpacity(0.02),
    Color(0xFFFFFFFF).withOpacity(0.02),
  ];
  static List<Color> gradient = [
    Color.fromARGB(255, 231, 231, 231).withOpacity(0.08),
    Color(0xFFFFFFFF).withOpacity(0.08),
  ];
}
