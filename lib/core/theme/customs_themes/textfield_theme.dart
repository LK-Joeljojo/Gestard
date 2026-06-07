import 'package:flutter/material.dart';

import '../../color.dart';

class JTextfieldTheme {
  static final lightInputDecorationTheme = InputDecorationTheme(
    
      contentPadding: EdgeInsets.only(left: 15),
    errorMaxLines: 3,

    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: JColor.popupColor,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: JColor.popupColor,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: JColor.popupColor,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,color: JColor.popupColor,),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,color: JColor.popupColor,),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 2,
        color: JColor.popupColor,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,color: JColor.popupColor,),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,color: JColor.popupColor,),
    ),
  );

  static final darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 15),
    errorMaxLines: 3,
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: JColor.popupColor,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: JColor.popupColor,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: JColor.popupColor),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,      color: JColor.popupColor,
),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: JColor.popupColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: JColor.popupColor),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: JColor.popupColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: JColor.popupColor),
    ),
  );
}
