import 'package:flutter/material.dart';

class HomeBoxDecoration {

  static BoxDecoration addTaskBox = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 50,
          color: Colors.black.withOpacity(0.23),
        )
      ]
  );
  
  static BoxDecoration pageBox =  BoxDecoration(
    color: Colors.white,
  );

  static BoxDecoration gradientBackground =  BoxDecoration(

    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Colors.purple,
        Colors.pink,
      ],
    ),
  );

  static BoxDecoration transparentBox = BoxDecoration(

      border: new Border.all(width: 1 ,color: Colors.transparent), //color is transparent so that it does not blend with the actual color specified
      borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
      color: new Color.fromRGBO(255, 0, 0, 0.5) // Specifies the background color and the opacity
  );

  static BoxDecoration titleBarBox =  BoxDecoration(

     // borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(200)),
      color: Colors.black,
      //borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(20)),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36)
      ),
      boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.9),
          spreadRadius: 5,
          blurRadius: 9,
          offset: Offset(0,2)
      ),],
     /* gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.black,
          Colors.black.withOpacity(0.8),
        ],
      ),*/
  );

  static BoxDecoration addButtonBox =  BoxDecoration(

    color: Colors.purple,
  );

  static BoxDecoration listBox =  BoxDecoration(

      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 6),
      ),],
    );

  static BoxDecoration dismissible =  BoxDecoration(

    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
    color: Colors.red.withOpacity(0.6),
  );

}

class HomeTextFormFieldDecoration {
  
  static InputDecoration addTaskField = InputDecoration(
    hintText: "Add new task",
    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
  );
  
}

class HomeTextStyles {

  static const TextStyle title = TextStyle(

    color: Colors.white,
    fontSize: 27,
  );

  static const TextStyle itemName = TextStyle(

      color: Colors.black,
      letterSpacing: 0.5

  );


}

