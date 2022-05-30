import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightThemeData = ThemeData(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    primarySwatch: Colors.blueGrey,
    backgroundColor: Colors.grey[200],
    canvasColor: Colors.white, // Affects Drawer
    cardColor: Colors.white,
    bottomAppBarColor: Colors.blueGrey[900],
    iconTheme: IconThemeData(
      color: Colors.grey[350],
    ),
    brightness: Brightness.light,
    shadowColor: Colors.grey.withOpacity(0.5),
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    dividerTheme: DividerThemeData(
      color: Colors.grey[500],
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.green));

var darkThemeData = ThemeData(
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  primarySwatch: Colors.grey,
  backgroundColor: Colors.black,
  // backgroundColor: Colors.blueGrey[800],
  canvasColor: const Color.fromARGB(255, 46, 46, 46),
  cardColor: const Color.fromARGB(255, 46, 46, 46),
  bottomAppBarColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.grey,
  ),
  brightness: Brightness.dark,
  shadowColor: Colors.green,
  splashColor: Colors.green,
  hoverColor: Colors.transparent,
  dividerTheme: const DividerThemeData(
    color: Colors.green,
    // color: Colors.grey[700],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.blueGrey[200],
  ),
  appBarTheme:
      const AppBarTheme(backgroundColor: Color.fromARGB(255, 46, 46, 46)),
  tabBarTheme: const TabBarTheme(
      // labelColor: Colors.amber,
      ),
);
