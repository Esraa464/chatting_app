import 'package:flutter/material.dart';

var darkStyle = ThemeData(
  primarySwatch: Colors.blueGrey,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.green),

  ),
  scaffoldBackgroundColor: Colors.grey,
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.yellow, fontSize: 30)
  ),
);


var lightStyle =ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.green,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.yellow),
      centerTitle: true,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.red),
      ),

      // titleTextStyle: TextStyle(
      //   color: Colors.black
      // )
    ),
    // elevatedButtonTheme: ,
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.yellow, fontSize: 30)));