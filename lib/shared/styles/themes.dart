import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme= ThemeData(
  scaffoldBackgroundColor: HexColor("333739"),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor:  HexColor("333739"),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle:TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.greenAccent,
    backgroundColor:  HexColor("333739"),
    elevation: 20,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  primarySwatch:Colors.blueGrey,
) ;


 ThemeData lightTheme=  ThemeData(
  scaffoldBackgroundColor: Colors.white,
  //primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    //  selectedItemColor: Colors.deepOrange,
  ),
  // primarySwatch: Colors.deepOrange,
);