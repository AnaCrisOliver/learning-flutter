import 'package:flutter/material.dart';
import 'modules/home/HomePage.dart';


void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        title: 'DL blog',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(), // Provide dark theme
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: HomePage(),

    );

  }
}


