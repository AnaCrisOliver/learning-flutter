
import 'package:flutter/material.dart';
import '../../AppStyle.dart';

class AppBarTextStyle {

  static const TextStyle dreamDefault = const TextStyle(
      fontFamily: 'Space Mono',
      fontSize: 20,
      color: Colors.white
  );

}

class HomePostBox {

  static BoxDecoration dark = BoxDecoration(
    color: AppColors.darkPurple,
    boxShadow: [BoxShadow(
      color: Colors.purple.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 7,
      offset: Offset(0, 6),
    ),],

    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColors.darkPurple,
        Colors.purple.shade400,
      ],
    )
  );

}

class HomeTitleStyle {

  static const TextStyle h1Style = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Mukta'
  );

}

class HomeContentStyle {

  static const pStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static const p2Style = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.white,
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

