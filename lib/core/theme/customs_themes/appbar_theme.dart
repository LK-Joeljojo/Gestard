import 'package:flutter/material.dart';

import '../../color.dart';

class JAppBarTheme{
  JAppBarTheme._();


  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: JColor.blackColor, size: 24),
    actionsIconTheme: IconThemeData(color: JColor.blackColor, size: 24),
    titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: JColor.blackColor)     
  );


    static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: JColor.whiteColor, size: 24),
    actionsIconTheme: IconThemeData(color: JColor.whiteColor, size: 24),
    titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: JColor.whiteColor)     
  );
}