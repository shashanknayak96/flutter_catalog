import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: GoogleFonts.poppins().fontFamily,
        backgroundColor: whitishGrey,
        primaryColor: bluishGrey,
        secondaryHeaderColor: bluishGrey,
        buttonColor: amazonDarkBlue,
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: GoogleFonts.poppins().fontFamily,
        backgroundColor: darkGrey,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.white,
        cardColor: lessDarkGrey,
        buttonColor: darkAmazonDarkBlue,
        appBarTheme: AppBarTheme(
          color: lessDarkGrey,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      );

  // Light
  static Color whitishGrey = Color(0xfff5f5f5);
  static Color bluishGrey = Color(0xff403b58);
  static Color amazonBlue = Color(0xff70d6e5);
  static Color amazonDarkBlue = Colors.cyan;

  // Dark
  static Color darkGrey = Color(0xff262626);
  static Color lessDarkGrey = Color(0xff404040);
  static Color darkAmazonDarkBlue = Color(0xff006b78);
}
