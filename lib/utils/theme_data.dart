import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightThemeData = ThemeData(
  fontFamily: GoogleFonts.nunitoSans().fontFamily,
  primarySwatch: Colors.blueGrey,
  backgroundColor: Colors.grey[100],
  canvasColor: Colors.white, // Affects Drawer
  cardColor: Colors.white,
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: IconThemeData(
    color: Colors.blueGrey[200],
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
  bottomAppBarColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.blueGrey,
  ),
  brightness: Brightness.dark,
  shadowColor: Colors.grey,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  dividerTheme: DividerThemeData(
    color: Colors.grey[700],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.blueGrey[200],
  ),
);
