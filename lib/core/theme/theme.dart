import 'package:flutter/material.dart';
import 'package:gestard/core/color.dart';

import 'customs_themes/appbar_theme.dart';
import 'customs_themes/bottom_sheet_theme.dart';
import 'customs_themes/checkbox_theme.dart';
import 'customs_themes/chip_theme.dart';
import 'customs_themes/eleveted_bouton_theme.dart';
import 'customs_themes/outlined_buton_theme.dart';
import 'customs_themes/text_theme.dart';
import 'customs_themes/textfield_theme.dart';

class JAppTheme {
  JAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: JColor.whiteColor,
    brightness: Brightness.light,
    fontFamily: "Poppins",
    colorScheme: ColorScheme.fromSeed(seedColor: JColor.primayColor),
    textTheme: JTextTheme.lightTextTheme,
    elevatedButtonTheme: JElevetedBoutonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButonTheme.lightOutlinedButtonTheme,
    appBarTheme: JAppBarTheme.lightAppBarTheme,
    checkboxTheme: JCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: JBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: JChipTheme.lightChipTheme,
    inputDecorationTheme: JTextfieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 37, 37, 37).withValues(alpha: 0.9),
    // brightness: Brightness.dark,
    fontFamily: "Poppins",
    colorScheme: ColorScheme.fromSeed(seedColor: JColor.primayColor),
    textTheme: JTextTheme.darkTextTheme,
    elevatedButtonTheme: JElevetedBoutonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButonTheme.darkOutlinedButtonTheme,
    appBarTheme: JAppBarTheme.darkAppBarTheme,
    checkboxTheme: JCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: JBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: JChipTheme.darkChipTheme,
    inputDecorationTheme: JTextfieldTheme.darkInputDecorationTheme,
  );
}
