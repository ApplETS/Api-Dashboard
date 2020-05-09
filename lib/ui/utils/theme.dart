// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

class ApplETSTheme {
  /// Primary
  static const violet = Color(0xff19375f);

  /// Secondary colors
  static const secondaryLightBlue = Color(0xff3d88eb);
  static const secondaryBlue = Color(0xff2d63ab);
  static const secondaryNightBlue = Color(0xff1c3f6c);
  static const secondaryDarkBlue = Color(0xff3d88eb);

  /// Logo colors
  static const Color lightBlue = Color(0xff0f9bd8);
  static const green = Color(0xff96bf26);
  static const grey = Color(0xffb5b5b5);

  static final lightTheme = ThemeData.light().copyWith(
      primaryColor: violet,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonColor: secondaryBlue,
      floatingActionButtonTheme: ThemeData.light()
          .floatingActionButtonTheme
          .copyWith(backgroundColor: secondaryBlue));
}
