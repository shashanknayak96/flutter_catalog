import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        backgroundColor: white,
        dividerColor: offwhite,

        primaryColor: red, // TextColor
        secondaryHeaderColor: black, // TextColor
        fontFamily: GoogleFonts.poppins().fontFamily,

        indicatorColor: red,

        textTheme: TextTheme(
          headline1: TextStyle(
            color: red,
          ),
          headline2: TextStyle(
            color: black,
          ),
        ),

        iconTheme: IconThemeData(
          color: red,
        ),

        primarySwatch: Colors.cyan,
        buttonColor: amazonDarkBlue,
        snackBarTheme: SnackBarThemeData(backgroundColor: bluishGrey),
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
  static Color whitishGrey = Color(0xfffdfdff);
  static Color bluishGrey = Color(0xff2d2d34);
  static Color amazonBlue = Color(0xff70d6e5);
  static Color amazonDarkBlue = Colors.cyan;

  // Dark
  static Color darkGrey = Color(0xff262626);
  static Color lessDarkGrey = Color(0xff404040);
  static Color darkAmazonDarkBlue = Color(0xff006b78);

  // Light
  static Color white = Color(0xffFFF4EC);
  static Color offwhite = Color(0xffE7CFBC);
  static Color black = Color(0xff2d2d34);
  static Color red = Color(0xffB97375);
  static Color blue = Color(0xff50A2A7);
  static Color yellow = Color(0xffE9B44C);
}
