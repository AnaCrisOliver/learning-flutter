import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {

  static const Color darkPurple = const Color.fromARGB(255, 69, 35, 122);
  static const Color lightPurple = const Color.fromARGB(255, 132, 75, 153);
  static const Color hotPink = const Color.fromARGB(255, 253, 73, 92);
  static const Color lemonGreen = const Color.fromARGB(255, 61, 218, 149);

}

class AppTheme {

  static ThemeData blackTheme = ThemeData (
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPurple,
    accentColor: AppColors.hotPink,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData whiteTheme = ThemeData (
    brightness: Brightness.light,
    primaryColor: AppColors.darkPurple,
    accentColor: AppColors.hotPink,
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