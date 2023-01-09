
import 'package:flutter/material.dart';

class MyTheme{
  static const Color colorGold=Color.fromRGBO(183, 147, 95, 1.0);
  static final ThemeData lightMode=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: colorGold,
    backgroundColor:colorGold,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 30
      ),
      bodySmall: TextStyle(
        fontSize: 22
      )
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor:  Colors.black,
          selectedLabelStyle: TextStyle(
              color: Colors.black
          ),
          selectedIconTheme: IconThemeData(
              color: Colors.black
          )
      )

  );
  static final darkTheme=ThemeData(

  ) ;
}