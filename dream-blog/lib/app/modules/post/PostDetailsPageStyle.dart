import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../AppStyle.dart';


class PostPageTitle {

  static const TextStyle h1Style = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.lemonGreen,
      fontFamily: 'Mukta',

  );

}

class PostPageContent {

  static const pStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    decorationStyle: TextDecorationStyle.wavy,
  );

}

class PostBox {
  static BoxDecoration light = BoxDecoration(

      border: Border.all(
        color: AppColors.lemonGreen,
        width: 1,
      ),
    borderRadius: BorderRadius.circular(5),
  );
}

String formatContent (String body) {

  String newBody;
  newBody = body.replaceAll("\n", " ");

  return '\n\n' + newBody;
} // remove undesirable line breaks and add the desirable ones