
import 'package:flutter/material.dart';
import '../../AppStyle.dart';

class AppBarTextStyle {

  static const TextStyle dreamDefault = const TextStyle(
      fontFamily: 'Space Mono',
      fontSize: 20,
  );

}

class HomePostBox {

  static BoxDecoration light = BoxDecoration(
    color: AppColors.lemonGreen,
  );
}

class HomeTitleStyle {

  static const TextStyle h1Style = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.darkPurple,
      fontFamily: 'Mukta'
  );

}

class HomeContentStyle {

  static const pStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static const p2Style = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.lemonGreen,
    fontFamily: 'Space Mono'
  );

}

String cutBodyText (String body) {

  String newBody;

  if (body.length >= 150) {
    newBody = body.substring(0,150) + " (...)";
  } else {
    newBody = body;
  }

  return '\n' + newBody.replaceAll("\n", " ");
} // limits text body size

