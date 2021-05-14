import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../AppStyle.dart';

class PostPageTitle {

  static const TextStyle h1Style = const TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: AppColors.darkPurple,
      fontFamily: 'Mukta',

  );

}

class PostPageContent {

  static const pStyle = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w300,
    color: AppColors.semiDarkPurple,
    decorationStyle: TextDecorationStyle.wavy,
  );

}

String formatContent (String body) {

  String newBody;
  newBody = body.replaceAll("\n", " ");

  return '\n\n' + newBody;
} // remove undesirable line breaks and add the desirable ones