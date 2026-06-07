import 'package:flutter/material.dart';

import '../../color.dart';

class JElevetedBoutonTheme {
JElevetedBoutonTheme._();

// lightTheme
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: JColor.whiteColor,
    backgroundColor: JColor.primayColor,
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle:  const TextStyle(fontSize: 16,color: JColor.whiteColor,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  )
);

// darkTheme

static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: JColor.whiteColor,
    backgroundColor: JColor.primayColor,
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle:  const TextStyle(fontSize: 16,color: JColor.whiteColor,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  )
);
}