import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://material.io/design/typography/the-type-system.html

class AppStyle {
  static final headline1 = GoogleFonts.openSans(
    fontSize: 80,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
    color: Colors.black,
  );
  static final headline2 = GoogleFonts.openSans(
    fontSize: 50,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: Colors.black,
  );
  static final headline3 = GoogleFonts.openSans(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final headline4 = GoogleFonts.openSans(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: Colors.black,
  );
  static final headline5 = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final headline6 = GoogleFonts.openSans(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Colors.black,
  );
  static final subtitle1 = GoogleFonts.openSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: Colors.black,
  );
  static final subtitle2 = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: Colors.black,
  );
  static final bodyText1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Colors.black,
  );
  static final bodyText2 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: Colors.black,
  );
  static final button = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: Colors.black,
  );
  static final caption = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: Colors.black,
  );
  static final overline = GoogleFonts.roboto(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: Colors.black,
  );
}
