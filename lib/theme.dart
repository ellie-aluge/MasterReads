import 'package:flutter/material.dart';
import 'package:travelappui/constants/colors.dart';

ThemeData kAppTheme = ThemeData(
    accentColor: kAccentColor,
    primaryColor: kPrimaryColor,
    highlightColor: kHighlightColor,
    backgroundColor: kPrimaryColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      headline3: TextStyle(
          color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20),
      headline4: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 13,
          fontFamily: 'Poppins'),
      headline5: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      bodyText1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 15,
          fontFamily: 'Poppins',
          height: 1.4),
      caption: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'Poppins'),
    ));

const kDefaultPadding = EdgeInsets.symmetric(horizontal: 30);

TextStyle titleText =
    TextStyle(color: kAccentColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = TextStyle(
    color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton =
    TextStyle(color: kAccentColor, fontSize: 18, fontWeight: FontWeight.w700);
