import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {

  static const Color darkPurple = const Color.fromARGB(255, 69, 35, 122);
  static const Color semiDarkPurple = const Color.fromARGB(255, 147, 56, 196);
  static const Color lightPurple = const Color.fromARGB(255, 132, 75, 153);
  static const Color hotPink = const Color.fromARGB(255, 253, 73, 92);
  static const Color palePink = const Color.fromARGB(255, 255, 230, 239);
  static const Color lemonGreen = const Color.fromARGB(255, 61, 218, 149);
  static const Color lilac = const Color.fromARGB(255, 234, 230, 255);

}

class AppTheme {

  static ThemeData purpleTheme = ThemeData (
    brightness: Brightness.light,
    primaryColor: AppColors.darkPurple,
    accentColor: AppColors.lilac,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

} // All themes available

class AppIcons {

  static const Icon account = const Icon(Icons.account_circle_rounded);
  static const Icon moreInfo = const Icon(Icons.more_vert);

}

class AppImages {

  static Image logo = Image.asset('assets/images/dl.png');

}