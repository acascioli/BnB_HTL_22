import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightThemeData = ThemeData(
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.grey[100],
  canvasColor: Colors.white, // Affects Drawer
  cardColor: Colors.white,
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[900],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    bodyText1: TextStyle(
      color: Colors.blueGrey[900],
    ),
    bodyText2: TextStyle(
      color: Colors.blueGrey[900],
    ),
    headline1: TextStyle(
      color: Colors.blueGrey[800],
    ),
    headline2: TextStyle(
      color: Colors.blueGrey[800],
    ),
    headline3: TextStyle(
      color: Colors.blueGrey[800],
    ),
    headline4: TextStyle(
      color: Colors.blueGrey[800],
    ),
    headline5: TextStyle(
      color: Colors.blueGrey[800],
    ),
    headline6: TextStyle(
      color: Colors.blueGrey[800],
    ),
  ),
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: const IconThemeData(
    color: Colors.blueGrey,
  ),
  brightness: Brightness.light,
  shadowColor: Colors.grey,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  dividerTheme: DividerThemeData(
    color: Colors.grey[500],
  ),
);

var darkThemeData = ThemeData(
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.blueGrey[800],
  canvasColor: Colors.blueGrey[900],
  cardColor: Colors.blueGrey[700],
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    subtitle1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    subtitle2: TextStyle(
      color: Colors.blueGrey[300],
    ),
    bodyText1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    bodyText2: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline1: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline2: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline3: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline4: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline5: TextStyle(
      color: Colors.blueGrey[300],
    ),
    headline6: TextStyle(
      color: Colors.blueGrey[300],
    ),
  ),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(
    color: Colors.blueGrey[200],
  ),
  brightness: Brightness.dark,
  shadowColor: Colors.grey,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  dividerTheme: DividerThemeData(
    color: Colors.grey[700],
  ),
);
